Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2F1872A928
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Jun 2023 07:27:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbjFJF1P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Jun 2023 01:27:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbjFJF1O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 10 Jun 2023 01:27:14 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A95F430F6
        for <linux-gpio@vger.kernel.org>; Fri,  9 Jun 2023 22:27:12 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1b00ecabdf2so14868155ad.2
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2023 22:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686374832; x=1688966832;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yiREeJQSPK0Ib5BdXtBr4j43RW3yO8gWoQ+7JNso2nQ=;
        b=UFBxydWze2BdTM62mmW/Ws/zyEHM4j+Wfot2UJ6zXU/HWXKn0FQM8/6NqXJqWgxV/d
         SFVjKOSL3cY0NW+wWLQI9LixHx3EjRw/vI4xUDOSrVKG4QdwloyWuiRsQL7LHX64Gcon
         h3UcQdhsgA/00nagNgftA2MMMbtPv9jTEhN374UPFa4DPBz7QT29r6YY5nyDeWrasBuh
         xdtL5yclnwKZgtiS0bouXB689pIO70ysCnM564wNivoYN+ijczqjwd/++Rh8t2srFN4r
         JdFQk64uwLhrxPxJeDRdtn8T0AO0QsSiYuk6xyE53vfWvPbJYGkd3sycFtfBsXNr6VXq
         7IWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686374832; x=1688966832;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiREeJQSPK0Ib5BdXtBr4j43RW3yO8gWoQ+7JNso2nQ=;
        b=b1UfJt5P/TgUUO4yfIZI12+tlCNc4U6Qu+higyaX7UzskHCzO7LtaJJKqUIByu9Mu+
         Unr1/fyGqiQO0tREQHNzSKA1B4Ebwo6dK2RG8xUGxBzvZ940j/4W8CqjjSUUWfnDN/QO
         ykQEqg/krx9amjo8UVpLttKO8N51F5b7aHb2hIpde10E3JIgEfFa/Vz58uiA09abPnAH
         uCysdpyMNvJMOnw+/MalaUJLeCcanWQSoRh/6dlOGYHcnsleeGiBqMX/pDret03HO6xM
         GNuUYzzJbtjaM7pIEbXqWNEyEmv8FlsIs406yw1ZyPNaSACTOlNSxtrhKFoHl6jIlLpZ
         XNpw==
X-Gm-Message-State: AC+VfDzhy4weCIF6LjrIXY4OrCvt1GwHuMTxlBz9rBmDx8L76MVFFzhm
        I7Qcoe4UkwQJaEBGatOzc0mSYNZhhOs=
X-Google-Smtp-Source: ACHHUZ6sqbeQ98fj/BynygJwNu2aczSyqsrpyYOVHPJ68i4AUP/EWAuIIgy/K8+BYZUsNl0IsXqR9w==
X-Received: by 2002:a17:902:ce8a:b0:1b1:a0bb:4c75 with SMTP id f10-20020a170902ce8a00b001b1a0bb4c75mr1083573plg.53.1686374832041;
        Fri, 09 Jun 2023 22:27:12 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id jg1-20020a17090326c100b001ab0b2dad2fsm4087906plb.211.2023.06.09.22.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 22:27:11 -0700 (PDT)
Date:   Sat, 10 Jun 2023 13:27:06 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        erik.schilling@linaro.org
Subject: Re: [libgpiod][bug] building rust bindings requires clang headers
Message-ID: <ZIQJquwzNacp1Nuh@sol>
References: <ZIKQVol59uXI5PyI@sol>
 <20230609061812.4haoqdyinsp47zet@vireshk-i7>
 <ZILE258m92XrBvNP@sol>
 <20230609062456.fqw3mqvtcactx2zj@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609062456.fqw3mqvtcactx2zj@vireshk-i7>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 09, 2023 at 11:54:56AM +0530, Viresh Kumar wrote:
> On 09-06-23, 14:21, Kent Gibson wrote:
> > I think that is what the AC_HEADER_STDBOOL already does - but that
> > detects the gcc header, and the additional check needs to be for the clang
> > header.
> > 
> > Unless you can convince clang to use the gcc headers?
> 
> Ahh, my bad :(
> 

On a relate note, how do you run clippy now?

When I tried `cargo clippy` I got an error about pkg-config not finding
libgpiod. Fixed that by pointing PKG_CONFIG_PATH at my local libgpiod
build.

But now I get:

--- stderr
  wrapper.h:1:10: fatal error: 'gpiod.h' file not found
  thread 'main' panicked at 'Unable to generate bindings: ClangDiagnostic("wrapper.h:1:10: fatal error: 'gpiod.h' file not found\n")', libgpiod-sys/build.rs:44:10


so I guess bindgen/clang needs to be pointed at the include directory,
but not sure how to do that without emulating whatever `make` is doing.

Same goes for `cargo build`, come think of it - now you have to build
using `make`.

How are you supposed to tell if your code is sub-par without clippy to
tell you?  Or, more generally, how does the development process for the
rust bindings work now?

Cheers,
Kent.

