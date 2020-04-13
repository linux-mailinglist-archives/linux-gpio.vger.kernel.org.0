Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB0C1A6240
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2020 06:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728756AbgDMEuJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Apr 2020 00:50:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:35234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728739AbgDMEuJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Apr 2020 00:50:09 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC044C0086B6
        for <linux-gpio@vger.kernel.org>; Sun, 12 Apr 2020 21:50:07 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id z9so3363207pjd.2
        for <linux-gpio@vger.kernel.org>; Sun, 12 Apr 2020 21:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=NhWWJKHzx6HRDsAvn1ifQlJriij6MaMtMDKuj/k9bmI=;
        b=Ilf0eHpIqXWj5aYziVWyWEVczzYaKO7xs3TOtGKjHZzpBRWKefSNqvpSIRz9SNA1An
         9T9MWJEW7SY+f2k1L1XT31fWJtol2e1d2HjiRCRiFhBnNqqDLSp0jz4yZhcBzFEXFCJl
         DqC+0HiE9pjACjrXoTJ0vnvCva1g7VOu4ySPHUM0rrmgfO4hZCugABlWPanwKiffA9Cr
         6jxz+bi8J10Hz69rgG3VeWy5fqc9aB6QN+Ch3O93EWByn3KSYkIepa9lZFJQlXM7LHza
         2Y9O8QagnqoBVDmWaYzh2rHHWsJHajxeOrWC+dBIyQHY6mbM5I/nw7gTU5zY+B1m+GU0
         vnqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=NhWWJKHzx6HRDsAvn1ifQlJriij6MaMtMDKuj/k9bmI=;
        b=eo9aYKIVqR7XeGWxqbVV/TjmRpNjvIVF2jQqeYW9IBRDrFVLfKhFd9BCBVtO3SSQ4t
         NdawsTOf2Khu3JdAVD7wB+ka40MhkA7lokVgfFdYFzf4Anervies0oNQ5IV5g+2Yuxkv
         Ez+rKJF7iIAKbLiebylTwoUKgslzOMz3AcyovUzRg5zyPdFx80nYDE+w8TrIRQO8Ll1Y
         0PEy3ZjA+F0oRc2xEQ/zuGIigIsUQLOjwuaA668mZgt4CrfiOAhV6LMDCxGfdeAKPiNJ
         hU7fk6gp7H7gcezM3ntTl3CSmi+DcU8RN5zT5qsZffY5YpDkriBQST9y/ul+HGHnHBAa
         WWfg==
X-Gm-Message-State: AGi0PuZGczJkNpQ/x8moYwJLvbxUm9X5xuEBouyBhzG4oNCosI7rIGdM
        2YP+D2Ew3ZkqKqavzw6BrkmT
X-Google-Smtp-Source: APiQypLxN2kWhH7Hd3VY0khso1oP2c+rM/YXoKt5qQA/anPTSaA65z9Pb4w05IXpmzUAuzbW/FopKw==
X-Received: by 2002:a17:902:7d89:: with SMTP id a9mr388312plm.233.1586753407086;
        Sun, 12 Apr 2020 21:50:07 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:621d:5eab:88eb:9bf8:e528:ec6])
        by smtp.gmail.com with ESMTPSA id f10sm8020649pjt.7.2020.04.12.21.50.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Apr 2020 21:50:06 -0700 (PDT)
Date:   Mon, 13 Apr 2020 10:19:59 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Amit Singh Tomar <amittomer25@gmail.com>
Cc:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        andre.przywara@arm.com, matheus@castello.eng.br,
        linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org
Subject: Re: [PATCH] pinctrl: actions: fix function group name for i2c0_group
Message-ID: <20200413044959.GA3071@Mani-XPS-13-9360>
References: <1586702060-3769-1-git-send-email-amittomer25@gmail.com>
 <2d629e23-ddb1-6033-5ea3-fe9e02476e18@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2d629e23-ddb1-6033-5ea3-fe9e02476e18@suse.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Apr 12, 2020 at 11:58:05PM +0200, Andreas Färber wrote:
> Hi,
> 
> Am 12.04.20 um 16:34 schrieb Amit Singh Tomar:
> > After commit 6f87359e8bcaf88381b9c9c038929e0e6872d308("pinctrl: actions: Fix
> > functions groups names for S700 SoC") following error has been observed
> > while booting Linux on Cubieboard7-lite(based on S700 SoC).
> > 
> > [    1.206245] pinctrl-s700 e01b0000.pinctrl: invalid group "i2c0_mfp" for function "i2c0"
> > 
> > This commit fixes it by using correct name for i2c0_group.
> > 
> > Fixes: 6f87359 ("pinctrl: actions: Fix functions groups names for S700 SoC")
> 
> The commit hash should have 12 digits.
> 
> Please also check the white spaces: The subject seems to have too many after
> "actions:", and there's one missing before each parenthesis above.
> 

Amit, you can use something like this

git log -1 --abbrev-commit --pretty=format:"Fixes: %h (\"%s\")%n" <commit-hash>

Thanks,
Mani

> Regards,
> Andreas
> 
> > Signed-off-by: Amit Singh Tomar <amittomer25@gmail.com>
> > ---
> >   drivers/pinctrl/actions/pinctrl-s700.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pinctrl/actions/pinctrl-s700.c b/drivers/pinctrl/actions/pinctrl-s700.c
> > index 47a4ccd..f579a65 100644
> > --- a/drivers/pinctrl/actions/pinctrl-s700.c
> > +++ b/drivers/pinctrl/actions/pinctrl-s700.c
> > @@ -1435,7 +1435,7 @@ static const char * const sd2_groups[] = {
> >   static const char * const i2c0_groups[] = {
> >   	"uart0_rx_mfp",
> >   	"uart0_tx_mfp",
> > -	"i2c0_mfp_mfp",
> > +	"i2c0_mfp",
> >   };
> >   static const char * const i2c1_groups[] = {
> > 
> 
> 
> -- 
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> GF: Felix Imendörffer
> HRB 36809 (AG Nürnberg)
