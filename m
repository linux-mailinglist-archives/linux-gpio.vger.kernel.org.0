Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84A926F84BC
	for <lists+linux-gpio@lfdr.de>; Fri,  5 May 2023 16:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232879AbjEEOSy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 May 2023 10:18:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232849AbjEEOSx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 May 2023 10:18:53 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E746E11DAB
        for <linux-gpio@vger.kernel.org>; Fri,  5 May 2023 07:18:40 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1ab0c697c2bso16712375ad.1
        for <linux-gpio@vger.kernel.org>; Fri, 05 May 2023 07:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683296320; x=1685888320;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IO5iL6vjxN5qIkzsxqmvDmrWm6nVXlj9jdFXmdpq+u8=;
        b=EjmlTtpUaQwszm+dNFYYoORyrlFPmfidDOd+tTPbMfccpma+XOnKaGJrf6bQladXwe
         NoEFWrpcBbegGhAQuhzSSnDnB4Xfvhyiv6Qq3um5/XHDNIZN3AgwmWms/S0gVhiMDc7h
         F50F2R6RXdbADDEwK7L8qOisvzrWmZlrguIMOk/de1b+pm4JsvuMnNITCvDIIn2I6Bir
         QkRVw5f0Riok2Jn2Tv9rGVJ07NZDp4sekpn3ifZGRuaGHqyqpthVytER1T+rIE0UUSha
         c0Sr1Ku9czMbGXHI0pNx6G8GODclzstUCv66y3vp2OaP87lrewIXFRxu+3GxoKCUjund
         E5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683296320; x=1685888320;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IO5iL6vjxN5qIkzsxqmvDmrWm6nVXlj9jdFXmdpq+u8=;
        b=FrLU2EqjaEsEqvT441jYZaEfeFIrea9YsM47afI+REUscjBjfQhXwxMT+o+tjmamB5
         aN5njarRBZEc++KAueZ5DuFykzF9HaThayOMRDN+HrtsJvqA9GrFot9d95NalVrifXzY
         zxgT+01Mm3RcLio6GBM++L12WBrvy5u84aPyhbSMu/VlDdVzqcUidlNYoV2vHzJ9NRsW
         7IfEOtzcv9tJ5bzkDJZZXTeJyZf0Zol6f9dPu3zF+IP1+7xtFBs8nyIeFUx73u/zJB6i
         bzkFlllf9jmXctoa55KIkMmvOeWByqt/AJmdHSn04hsSQPLLEkmCvTN8XZxBKwdIv4jJ
         qd2A==
X-Gm-Message-State: AC+VfDwhc+h/1QmXxzcuhMI0dBTf2n0+tqp3HC7vl7Ye/zEG/bLDNtR+
        ZVNaO8O9L9Gpmw2AXpDC+z8=
X-Google-Smtp-Source: ACHHUZ6zU9TsUOd4sFG+n8pl8XHP0qxasX1GacsiarvA8Oln2GIVhivDlWUP179WUd0TE0IskgEZJg==
X-Received: by 2002:a17:902:aa03:b0:1aa:f78d:97b7 with SMTP id be3-20020a170902aa0300b001aaf78d97b7mr1499565plb.46.1683296320199;
        Fri, 05 May 2023 07:18:40 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id u3-20020a170902e5c300b001ac3f74f459sm1729761plf.224.2023.05.05.07.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 07:18:39 -0700 (PDT)
Date:   Fri, 5 May 2023 22:18:34 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Milo Spadacini <milo.spadacini@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        andy.shevchenko@gmail.com, brgl@bgdev.pl,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] tools: gpio: fix debounce_period_us output of lsgpio
Message-ID: <ZFUQOpu+8In6aPkF@sol>
References: <CA+1hoUVnw7kXB15rzK=tQdX2cyGMoXEgThOiqA=pYDwqF6TAwQ@mail.gmail.com>
 <CACRpkdZ5jq=wCtJs1oRLwvMDysca2ECxGyBoCrxq0GrMXyA37w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZ5jq=wCtJs1oRLwvMDysca2ECxGyBoCrxq0GrMXyA37w@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 05, 2023 at 01:32:59PM +0200, Linus Walleij wrote:
> On Fri, May 5, 2023 at 7:57 AM Milo Spadacini <milo.spadacini@gmail.com> wrote:
> 
> > Fix incorrect output that could occur when more attributes are used and
> >  GPIO_V2_LINE_ATTR_ID_DEBOUNCE is not the first one.
> 
> Nice patch! And correct. But hard to apply!
> Can you resend:
> - Including a Signed-off-by: Milo Spadacini <milo.spadacini@gmail.com> line
> - Not using HTML encoding
> ?
> 
> Here is some generic help on sending email to the lists:
> https://docs.kernel.org/process/email-clients.html
> 

And, assuming this is the updated patch, the subject should begin "[PATCH
v2]"

Cheers,
Kent.
