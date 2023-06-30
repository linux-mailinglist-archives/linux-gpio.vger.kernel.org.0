Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9900C743BEC
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jun 2023 14:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230046AbjF3McB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jun 2023 08:32:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbjF3McA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2023 08:32:00 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2B7CED
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 05:31:59 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-553b2979fceso777884a12.3
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 05:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688128319; x=1690720319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1h1WcFIDowrD456KcTEBS6klhn53mSyIAJX5+U2RwOo=;
        b=XHDJIt1YWPf9zDtLYtt3U0gPCwapciWm0mmXpC8cnUat/P9RlcK7n+/DmSQKLQihlp
         NfLrbL9dPd+K8eGvKQBoqpd19wBwk/JaV6zlUgn4UdXgPGpOKubOOuu9IYQEvnTUm8Z1
         rtOMMGespavTT1HwFfSefnnqikFDumeeF8KE70AFYTLz6Rp2eTV+Xl3A6G/0ob9sOfI0
         7IyLJrdtBVJ8kym+j4olwrWm13XUcoxQ28a3m45RIu5Qk6MkbnU8E+xp/yf0TqSEpBgE
         WphIzt75Dv7c1AS1KfNXXK2Kv5ghvCGpYdtVBEHE2pQTyO3to4eRZAyUzZj8xVKuGoVj
         FatA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688128319; x=1690720319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1h1WcFIDowrD456KcTEBS6klhn53mSyIAJX5+U2RwOo=;
        b=fDCVfpL8EgLuxPwb2gL4856GRNsYppPaCOtwZLfw3brYYF7kfv0adK00ARtEdvk9SG
         At3Sae5FoeWOxlvvPTG06XO2wu8jDoNhnAewl1KX3zN48Zlo86nO+ddaaFK7MzNy+IVS
         KPcTKpj9LwHhzhF6hKQ5xtxEWGlsMUqI8R6wy8kjS6anuajiEKTk0m69knrnPUmX0PiH
         AwvZAxeHD2DS+IDs3Ng4rgDlr4fJ8bIyZZ72S4JNTf/AzvcBujcgc8mUkszg78b/mqF+
         9LCPlfRjnl7G9Rn/fftIDC0D8im/Yk6NHlw4SZD+w6NCJ6900Ad2SgZl8PWC2+DgUnHP
         X/Wg==
X-Gm-Message-State: ABy/qLbYEETNY8GkTgpIoYO6EN8mGgUUJyLbrX/c6F8a4z/q6U1NIsDP
        84wgfzguv9ifa9MTUXeRnOuWTT/5t2Y=
X-Google-Smtp-Source: APBJJlFTUeIc1cya4Xy5DTPu2+4UdaxdR8U3vleGJPbA6gYRWFAMXtT1RDc520evOqtC8TNoMHGS/Q==
X-Received: by 2002:a05:6a20:428b:b0:12d:7d21:eadf with SMTP id o11-20020a056a20428b00b0012d7d21eadfmr884503pzj.52.1688128319121;
        Fri, 30 Jun 2023 05:31:59 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id q17-20020a62ae11000000b00679dc747738sm7495022pff.10.2023.06.30.05.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 05:31:58 -0700 (PDT)
Date:   Fri, 30 Jun 2023 20:31:53 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] build: remove redundant SOURCES assignments
Message-ID: <ZJ7LOWuPIwR/fVyk@sol>
References: <20230630122825.117902-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230630122825.117902-1-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 30, 2023 at 02:28:25PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> For any given target (let's say foobar), automake defaults to looking for
> foobar.c if foobar_SOURCES are not specified. Remove redundant assignments
> as we've seen multiple hidden typos in makefiles already.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Makes sense to me.

Reviewed-by: Kent Gibson <warthog618@gmail.com>

