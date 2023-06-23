Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 904EA73B228
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jun 2023 09:57:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbjFWH5V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jun 2023 03:57:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjFWH5U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jun 2023 03:57:20 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FF7E1BD6
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jun 2023 00:57:19 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-31126037f41so388837f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jun 2023 00:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687507038; x=1690099038;
        h=in-reply-to:references:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrSvzGtb9AYwsC4cfpy3x10OTUr4yYkCvIPXQoAZYtM=;
        b=jSbFehyN0wWi7UCBAp6M3FWAhbt9wSB4PwHIhavpjB9lxxv3zrGsbE1Vg6jdHm4+8h
         1Wua4xOTRtquAvuqI6Ndr03fLy7BwUenBlg8LfvJFHu4lyYoQGhPj6mEQ4FLj1fGjLJ6
         OPqNpuq1i12uRy5Y4fIrSTh0e504UATMqDbDmv2gVJkla/mEv98gLZ4SQnI4YyrJIRPR
         L4UcRNAvhy6S76pO1BSucU09JMInVuZukTGvVUiNf2Mwe019TKcE0Fd9gBqKvk0R0eId
         hpSQo/OxupoqXgZ88ceMuZZzbOV6zJnqVZyfVvTXPMU1gmL9aA0FGi7v91yFzz2JRJBO
         1+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687507038; x=1690099038;
        h=in-reply-to:references:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wrSvzGtb9AYwsC4cfpy3x10OTUr4yYkCvIPXQoAZYtM=;
        b=ic6q/OUybJjYR2xzCqiteo01IDrQbrr2PiHldNygIj8VpcYuRfWvtdEj1t2pD01BlT
         j8OoL+us5OCcv1GkdpGLJvKL9evCDdTgL4yqRq+eKE5GVxtmYxgBa/l9lrXYFDT0v0wM
         zq1KvkpESMMKtKrCGEbaBUfH90VPVYnPGpXNODrM5aO76fUqxNyOOcLyFfWxqw3V+ihE
         Acc8i5C8MNuIBVxZeJH4F+l/EWNfXPQnIeBiefmMjp4HIlu6zxXuTFFiB/R+6acL3Yej
         /u3Fc0VjjWQ1RJbAALmet8OznZqTQvBFpcS/+IVv7uGt8G7QcCHLuQqdMzjj13SX4XRz
         sF1w==
X-Gm-Message-State: AC+VfDyaKOR5WLYmJrpyvbedvmz0Db2Mgif+ZAgO1kRsC+gXIZuW3N/N
        e+Nde0nQovhviCNvCjBgpz3Hn9SAoQpfOLNtAEs=
X-Google-Smtp-Source: ACHHUZ44eS9QJiahib9YTGsNpR0izaj10LOtnw+QaBxUeUbnnfYxoMuCmoa0yIpilVoiSfKjwAHUHw==
X-Received: by 2002:a05:6000:1370:b0:311:1a45:3606 with SMTP id q16-20020a056000137000b003111a453606mr16395206wrz.30.1687507038062;
        Fri, 23 Jun 2023 00:57:18 -0700 (PDT)
Received: from localhost (i5C7405EF.versanet.de. [92.116.5.239])
        by smtp.gmail.com with ESMTPSA id x8-20020a5d54c8000000b0030fae360f14sm8814941wrv.68.2023.06.23.00.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 00:57:17 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 23 Jun 2023 09:57:17 +0200
Message-Id: <CTJVBIO5TY63.PUKXXIU50HDG@fedora>
To:     "Kent Gibson" <warthog618@gmail.com>, <linux-gpio@vger.kernel.org>,
        <brgl@bgdev.pl>
From:   "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [libgpiod][PATCH 8/8] bindings: rust: examples: replace tools
 examples with use case examples
X-Mailer: aerc 0.14.0
References: <20230623043901.16764-1-warthog618@gmail.com>
 <20230623043901.16764-9-warthog618@gmail.com>
In-Reply-To: <20230623043901.16764-9-warthog618@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri Jun 23, 2023 at 6:39 AM CEST, Kent Gibson wrote:
> Replace tool examples with use case examples drawn from the tools,
> gpio_events example with buffered_event_lifetimes, and
> gpio_threaded_info_events with reconfigure_input_to_output.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>

Reviewed-by: Erik Schilling <erik.schilling@linaro.org>

>     let mut buffer =3D libgpiod::request::Buffer::new(4)?;

Slightly tangential:

Maybe the API should provide some sensible defaults for the buffer size?
(Or just set a sane default and provide ways to override it)? The change
from 1 -> 4 for bulk operations seems reasonable, but I feel like a user
just getting started with all of this likely won't know what might be
good values to pick...

- Erik
