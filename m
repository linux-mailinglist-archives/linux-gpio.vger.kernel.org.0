Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78F457B16C2
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Sep 2023 10:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231494AbjI1I6J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Sep 2023 04:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231467AbjI1I6I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Sep 2023 04:58:08 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 509281AE
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 01:58:06 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-692eed30152so6408603b3a.1
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 01:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695891486; x=1696496286; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JLtKGMdZh/XlAGHaIywCRFbTM5rl7oee6zeIeQO67S0=;
        b=uJdN/2KQdDVocDESnlA2dANITQFOEhZzvYSezajDM/T0EAtYq/IsvC/AwrMhw2Wxvf
         0HRHX5qLkzq9rW8zwayoZpq4AF9vwjEKw0FQdY/vK491lonKbz148NRK7O+ic3VjvtTb
         3ngKwN0KaxU2+QEFPCVPcne83s85kcNSDebbyAsY3+l7cGHzmVyHpQNwbnP91JhDnMBt
         bwSGGWrc3BrA0EKjl//2yeIRAneZbfK+BPQuIEeJ6yh+fSve1sUaIGp1dZY5lUzUEumP
         WPvvWGySxdIx6ah7+msSVQxBNzSJwmSbeHA4FM/Non1R24hLhqpAjd/kK5lysWUcVshE
         QrVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695891486; x=1696496286;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JLtKGMdZh/XlAGHaIywCRFbTM5rl7oee6zeIeQO67S0=;
        b=FwTqUt2DLkxNzOGkMnZfQxmrn21zuG+cc2/geUARxrF4DQuK1HvxVKwtwq2+Vs1W2L
         g2mpe+I5jTSJhkEUUWo0PlkjU1WEilSXjXap9V4xpMVyMR9st7LF0dit+7fPVdye7PxO
         /82E/JVB2oQN8y7R/xeyzSc+pDMSmGkIIuIOKYoevYePhLPawwnmKLIaATeRNFCbvnmz
         5+tRaTmhBl8lnLZfWZUSD736MCdHWRRHt5FPU7PxrIFuRwI9/+YKby26KVG8Csq9Q3vE
         o4wH1RF/VuT3OXhlN38eIKFkQU2hpJrEFoD1VDr2S6fG2/ognHVdfA3COj0MjM8ULsbg
         UpDQ==
X-Gm-Message-State: AOJu0Yyt6EgGLwq+sDn0X3NPgdLRlybAMyLNwBZPJ/7twc1MCh4MyRSC
        Tr3G5np1/OSzoGJPmt6sR5b+zQ==
X-Google-Smtp-Source: AGHT+IFvl3oEotvjK8QEBVeVXrFlyt5BhbCh/Wimw1iQtMc7Twq7kdeY8jaZ0OFVgmruNI/BjoXmfQ==
X-Received: by 2002:a05:6a00:2da4:b0:68e:3eab:9e18 with SMTP id fb36-20020a056a002da400b0068e3eab9e18mr594361pfb.12.1695891485802;
        Thu, 28 Sep 2023 01:58:05 -0700 (PDT)
Received: from localhost ([122.172.81.92])
        by smtp.gmail.com with ESMTPSA id fk1-20020a056a003a8100b00682868714fdsm13461573pfb.95.2023.09.28.01.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 01:58:04 -0700 (PDT)
Date:   Thu, 28 Sep 2023 14:28:02 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][PATCH 0/2] rust: bindings: drop unneeded Arc within
 Chip
Message-ID: <20230928085802.zadlglftnccyteo2@vireshk-i7>
References: <20230927-chip-drop-arc-v1-0-28013bf95948@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927-chip-drop-arc-v1-0-28013bf95948@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 27-09-23, 11:25, Erik Schilling wrote:
> While reviewing code for thread-safety. I realized that this structure
> was a bit more complex than it should be...
> 
> To: Linux-GPIO <linux-gpio@vger.kernel.org>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> 
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
> Erik Schilling (2):
>       bindings: rust: construct chip infos by reference
>       bindings: rust: drop unneeded Arc within Chip
> 
>  bindings/rust/libgpiod/src/chip.rs | 83 +++++++++++++++-----------------------
>  1 file changed, 33 insertions(+), 50 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
