Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA5FFAFFCD
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 17:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728287AbfIKPTx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 11:19:53 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35104 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbfIKPTx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 11:19:53 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 41E16611FD; Wed, 11 Sep 2019 15:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568215192;
        bh=BxzymE4Du8iospVx8lQ4+Kl7Ik1hqE+DIRt/RDx1/Rc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N9C6sFzmyVoxXSQ2a5Bh6l2EhIogpS9MZ17s4ubhaJUSetY/ZjqyJuUFZIXJpIQic
         ys1Kek/nFox28fW0nbyJ6Dc5VHe8cvChmP9bi+IIzSm+PPEKj0NO4GL6ZBnHIHkNp0
         R3WAiZOKxZ5rV78caB7izlphscnuQUzNhQ8ZDIlY=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from localhost (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 77F4161197;
        Wed, 11 Sep 2019 15:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568215190;
        bh=BxzymE4Du8iospVx8lQ4+Kl7Ik1hqE+DIRt/RDx1/Rc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DCCUrRDdd9ILFg7hBJRAudHEHOuY9bUsakEeYLhzirL7B39j3iGakjSuxQhBDatnG
         zBVDxQ5LTW1znyRCWQdh9SdrcKRAaUvnGtxdv/D1MKA4s6KANF7nK2kMAueCRa2kLA
         MwJjILN3Hm2jZ+Vc3Qtiycg6069SKKTHWbGEo3c0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 77F4161197
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
Date:   Wed, 11 Sep 2019 09:19:48 -0600
From:   Lina Iyer <ilina@codeaurora.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        mkshah@codeaurora.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH RFC 05/14] dt-bindings/interrupt-controller: pdc: add SPI
 config register
Message-ID: <20190911151847.GA30053@codeaurora.org>
References: <20190829181203.2660-1-ilina@codeaurora.org>
 <20190829181203.2660-6-ilina@codeaurora.org>
 <CACRpkdaReFzjb_hcDbQwqMX+whzscLpeZpJPHKqOo+9tANzemA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACRpkdaReFzjb_hcDbQwqMX+whzscLpeZpJPHKqOo+9tANzemA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 11 2019 at 04:05 -0600, Linus Walleij wrote:
>On Thu, Aug 29, 2019 at 8:47 PM Lina Iyer <ilina@codeaurora.org> wrote:
>
>> +- qcom,scm-spi-cfg:
>> +       Usage: optional
>> +       Value type: <bool>
>> +       Definition: Specifies if the SPI configuration registers have to be
>> +                   written from the firmware.
>> +
>>  Example:
>>
>>         pdc: interrupt-controller@b220000 {
>>                 compatible = "qcom,sdm845-pdc";
>> -               reg = <0xb220000 0x30000>;
>> +               reg = <0xb220000 0x30000>, <0x179900f0 0x60>;
>>                 qcom,pdc-ranges = <0 512 94>, <94 641 15>, <115 662 7>;
>>                 #interrupt-cells = <2>;
>>                 interrupt-parent = <&intc>;
>>                 interrupt-controller;
>> +               qcom,scm-spi-cfg;
>
>You can probably drop this bool if you just give names to the registers.
>
>Like
>reg = <0xb220000 0x30000>, <0x179900f0 0x60>;
>reg-names = "gic", "pdc";
>
>Then jus check explicitly for a "pdc" register and in that case
>initialize the PDC.
>
Well the address remains the same. The bool defines how to access that
register address - from linux or from the firmware using SCM calls. But
I get your point, I could have different register namess - pdc-linux or
pdc-scm and request by name. I can then use that to determine the mode
for accessing the register.

Thanks,
Lina

