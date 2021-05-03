Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48BB4371142
	for <lists+linux-gpio@lfdr.de>; Mon,  3 May 2021 07:32:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbhECFc4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 May 2021 01:32:56 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:32224 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbhECFcz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 May 2021 01:32:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1620019923; x=1651555923;
  h=message-id:subject:from:to:cc:date:mime-version:
   content-transfer-encoding;
  bh=K3ZLeTxblP+IG0mhcQEIAMIP6mRZUYsAwnrCwGu8tew=;
  b=I8GXT9sD5EvCxIyOalaeAUuMnqvlo2319BZpx00eb5yOenIwnIEYVhAC
   s3hfPb0zx5MpGFHkbKuiLFLL/yQDoMb8HvoZQkT1ZIkUVwzIhfAo3qhK8
   Rgmth8tkUx6LylNaUqJ74hJbWiQMgi9dmbc7+hJorHLzi1avTgbynozlg
   8UHcMNmMSgNruwEduE6hdwaD8yv5lLXgFT/xR9ToNH3aYXV2HHNPItXu/
   hQHQeyqG9bHrwlTzStuEhz6+puTOYteeTds3nGUSOiYp2I33RaMJydsc7
   b9MzL/mSs4dsEKY/s4zd4hOmwEPa0r4FL/QcPRrdKwktx9s3mWfzPOiBY
   Q==;
IronPort-SDR: ulF8wI5H7oCe23hnnHFuGRR65eaLDWp6dRJLYfaj14pvgBFf1OgIYr2o8OX2pFypehgpqfRkB2
 1bNh3+Hvy4xRpHylNQXxRRC3dotaOrkYP6Q/YFIVeVsCrFU8FLm66o19lA+rF98Nbrznuoc2xS
 dEKYuykw9vINdp3WedxWNR/hQ0vry5ZSKl2nUy9k79MsctKJtHvxqzyuFkx2mzWWMF+cyp38Er
 eSnnTHjb5YijBTGZDULLXqGpP2Oa81xJEFAf86FWYRt/nHgN/ppfQC/QbJa0ilxcKygkVWFrEp
 erw=
X-IronPort-AV: E=Sophos;i="5.82,268,1613458800"; 
   d="scan'208";a="125489431"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 May 2021 22:32:02 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 2 May 2021 22:32:02 -0700
Received: from CHE-LT-I21385.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Sun, 2 May 2021 22:31:59 -0700
Message-ID: <dd5443384071ef55c46316e7a66cca55348f6005.camel@microchip.com>
Subject: Error code handling by GPIO subsystem for PIN_CONFIG_PERSIST_STATE
 config
From:   LakshmiPraveen Kopparthi <LakshmiPraveen.Kopparthi@microchip.com>
To:     <linux-gpio@vger.kernel.org>,
        LinusWalleij <linus.walleij@linaro.org>
CC:     Kumaravel Thiagarajan - I21417 
        <Kumaravel.Thiagarajan@microchip.com>,
        Sundararaman Hariharaputran - I21286 
        <Sundararaman.H@microchip.com>
Date:   Mon, 3 May 2021 11:01:56 +0530
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello GPIO Maintainers,

I am writing a GPIO device driver for one of our PCIe based
devices.While addressing the warnings and errors reported by checkpatch
script, I ran into an problem while fixing this. 

WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP#197:
FILE: kernel_src/drivers/gpio/gpio-pci1xxxx.c:159:+ ret = -ENOTSUPP;

This warning is reported against the gpio_chip -> set_config()
callback's implementation because for the not supported configurations,
-ENOTSUPP is returned by this callback.If -ENOTSUPP is replaced by --
 -EOPNOTSUPP , the GPIOs are not accessible from both the device node
(char device in /dev) and from sysfs interface as well.

On further analysis it is understood that while trying to access a gpio
from user space,

The gpio sub system calls gpiod_set_transitory() API to issue a set
configuration with PIN_CONFIG_PERSIST_STATE as a parameter.In this
context, set_config() call back in the device's source code gets
called. Since the PIN_CONFIG_PERSIST_STATE configuration is not
supported by our device, It returns an error code.

If the error code is -EOPNOTSUPP, then the gpio access request is
terminated by returning the error code as EOPNOTSUPP.If set_config()
returns ENOTSUPP then the API- gpio_set_config_with_argument_optional()
internally updates the return value to true  thus making the gpio
access request to proceed further.

If gpio_set_config_with_argument_optional() API updated to handle the
EOPNOTSUPP along with ENOTSUPP, then the issue seemed to be resolved.

I am planning to submit a patch to add support for our device. Please
let me know If my understanding is correct or not and also the way
forword on this issue.   

Thanks,
Lakshmi Praveen.


