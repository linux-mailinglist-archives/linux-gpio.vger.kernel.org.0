Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ACDC3AAD9F
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jun 2021 09:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230211AbhFQHd3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Jun 2021 03:33:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:60200 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230161AbhFQHd3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 17 Jun 2021 03:33:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26A03613BF;
        Thu, 17 Jun 2021 07:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623915081;
        bh=B+8PluC5gn7PaaKMr6F+x7FROpiA8NE9BPOp7pIbW30=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1AbMsNS+L7wOdvtcLLG0BWoG35WDrhc8RYxBB1YDWHN19qXYhjQRLPC3xgigZ+6HB
         ZEUi6T3Kxdm950FfKr/ivFPqSmlWnHvts/zogwtNrBUJrmWLOeHhl4PzNV0KfiH7P/
         4hrv7Dgy04/79wanH2jY+V3DfxZ/S4na+Ilq/wPE=
Date:   Thu, 17 Jun 2021 09:31:19 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sai Krishna Potthuri <lakshmis@xilinx.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michals@xilinx.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        git <git@xilinx.com>,
        "saikrishna12468@gmail.com" <saikrishna12468@gmail.com>
Subject: Re: [PATCH v6 3/3] pinctrl: Add Xilinx ZynqMP pinctrl driver support
Message-ID: <YMr6R34n2j2BWXlf@kroah.com>
References: <1619080202-31924-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1619080202-31924-4-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <CAHp75VfCbbnN-TBJiYFb=6Rhf30jA-Hz1p1UORsubF7UG6-ATw@mail.gmail.com>
 <DM5PR02MB3877B234F85F3B4887DF3A95BD429@DM5PR02MB3877.namprd02.prod.outlook.com>
 <CAHp75VfugGqLNU8LKJ_K3dPr=-eh6LHx75eV=33jH9OnryBoGA@mail.gmail.com>
 <DM5PR02MB387726AB4144F0DB28105007BD409@DM5PR02MB3877.namprd02.prod.outlook.com>
 <DM5PR02MB38771A8BEEB3E01006B14E46BD539@DM5PR02MB3877.namprd02.prod.outlook.com>
 <MW2PR02MB388198021497399F280A374EBD0E9@MW2PR02MB3881.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MW2PR02MB388198021497399F280A374EBD0E9@MW2PR02MB3881.namprd02.prod.outlook.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 17, 2021 at 06:37:18AM +0000, Sai Krishna Potthuri wrote:
> Ping!

ping what?
