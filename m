Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C747243F632
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Oct 2021 06:38:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230362AbhJ2Ekk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Oct 2021 00:40:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbhJ2Ekj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Oct 2021 00:40:39 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB04BC061570;
        Thu, 28 Oct 2021 21:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=zQtZCuMLt0UoTHhnTLG6cTSCEB8YcEsPDeHATs4O5b8=; b=q4jBIQc9FMWP7i/n3mqUTAyiia
        WjNrG1jZHabR6jxt2LIhmyRXgn+14/ZrzHoNfSZpSJQ4T4Ic0GgbPhtimFy53FTpQs3TNCfgelMCI
        Y9STc5apJGh/PL/P7udqyvuLLnpwBWLpW+FUUOT+Ki5vl0Rnxfe77Q58ngchkEkVID8EGMyecB/Es
        iBPCx76mIdC/9rHzgW4rmRIjCpmgT6urZtGmqPhCAzp5zcsFzBogK96sykWVcUOM+mW/H7ezdF5Zs
        GsCKOrcof5cPxBc0sFnBh+eGerrg1CS/AvrbfXh6lG6IoU/xM705chUY4lRAIx0PbcRf0EKN/oEA8
        EtqLAlmg==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mgJeZ-009oiF-Dk; Fri, 29 Oct 2021 04:38:08 +0000
Subject: Re: [PATCH 1/3] pinctrl: Add driver for Sunplus SP7021
To:     =?UTF-8?B?V2VsbHMgTHUg5ZGC6Iqz6aiw?= <wells.lu@sunplus.com>,
        Wells Lu <wellslutw@gmail.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc:     "qinjian@cqplus1.com" <qinjian@cqplus1.com>,
        "dvorkin@tibbo.com" <dvorkin@tibbo.com>
References: <1635324926-22319-1-git-send-email-wells.lu@sunplus.com>
 <1635324926-22319-2-git-send-email-wells.lu@sunplus.com>
 <3ed37bf9-d698-2a03-60e7-9b357e3abfb4@infradead.org>
 <930472fa25b7462aa49e33d694e4d759@sphcmbx02.sunplus.com.tw>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <0d1e4efe-bdc1-6646-384e-da7e90abc36d@infradead.org>
Date:   Thu, 28 Oct 2021 21:38:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <930472fa25b7462aa49e33d694e4d759@sphcmbx02.sunplus.com.tw>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10/28/21 8:40 PM, Wells Lu 呂芳騰 wrote:
> Hi Sir,
> 
> Thank you for your review.
> 
> I modified errors in Kconfig you pointed out.
> 
> Could you please teach me what is the next step I need to do
> (This is my first submission to Linux kernel main-line)?

Hi,

I would wait another day or two to see if there are any other
comments or reviews of the patch series, then send a v2 of
the entire series.

> 1. Should I make a patch [PATHC 1/3 v2] for Kconfig and submit
>    again?
> 2. Or wait for other files of the patch [PATCH 1/3] being
>    reviewed and then submit patch again.
> 3. At first patch, I used 'git send-email' command to send a
>    patch series. The command is:
>    git send-email \
>    --to linus.walleij@linaro.org \
>    --to linux-gpio@vger.kernel.org \
>    --to linux-kernel@vger.kernel.org \
>    --to robh+dt@kernel.org \
>    --to devicetree@vger.kernel.org \
>    --cc dvorkin@tibbo.com \
>    --cc qinjian@cqplus1.com \
>    --thread 000*.patch
>    Please teach me what command options of 'git send-email'
>    I should use to send the version 2 patch.

I suppose that you are using git to create patches.
I don't create patches with git, so I don't know what it takes to
create and send v2 of a patch series.

If you are not using git to create patches, you can just modify
the Subject: line in each email to include the "v2" string.

In either case, but sure to describe the changes from v1 to v2.
This description goes after (below) the "---" line. I put it before
the diffstat output with a blank line separating them.

> 4. If this is not a correct way to reply your email, please teach
>    me how to reply maintainers' email.

This is fine.

thanks.
-- 
~Randy
