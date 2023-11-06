Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 245E97E229A
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Nov 2023 14:00:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229921AbjKFNA3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Nov 2023 08:00:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231590AbjKFNA2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Nov 2023 08:00:28 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C93D6B8
        for <linux-gpio@vger.kernel.org>; Mon,  6 Nov 2023 05:00:25 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso673952466b.1
        for <linux-gpio@vger.kernel.org>; Mon, 06 Nov 2023 05:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699275624; x=1699880424; darn=vger.kernel.org;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgmXTfsucsyc2mEwxncXwhLY2vliZRkVbdof4kDhbdE=;
        b=gMGfzAIhZth54zZSWlLYfndP1x4z4ux9A54wbyPUIy2XPxWiT9ECAfDWjtPZJZsRe7
         AZEeFgu7WF4ahStgJmXTc0u9gS1rbMPIe4lSjUfT8D2K8jw00jPc7n4cp8DNtsLCcNs8
         qF7k88yexRPOF3kcZgVU+EbH/4C8IITFMBcP/pLnlz+8maikzwK6MPyEpVWC+06eEe96
         e80baJzsMISO+T6yWPUrl9FTeFWWM4b8Xi5wrgL+8cvm7wN6aQRCItfN5osMVGZ02E2n
         1g4x/eKgJ29mRAMX4vvnc9luEq9/adg6gBKrBoCTNC2H77zY+XglX4ak32qAPL1fKCtf
         DDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699275624; x=1699880424;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wgmXTfsucsyc2mEwxncXwhLY2vliZRkVbdof4kDhbdE=;
        b=RB3gFhZ1FtrQGk7FaHcGaGEPL/ef3jf40BnY/Eciuh9qBHpFN1btN872n3t9adwYrC
         1f/05ktKB0EaovjwKds9FfI3yAMnonmhxlw1NKGGVbHK6uSf5CpZgTfSK8HFOFUf+enN
         QLMZQXvu3akp+5yuTgb/67GjId37fcCIL/3Bd9WXLFjs43ZXevAUWkAbeB8drOpVnCWd
         FQNByqUebuBeIiTLiGpP66xiFa1DLISdnvM7GNdgCD7OPLcgrD33tiaQpHTVm9l5S2zj
         Pnay5WsCUgT5NrWvz+tFRa5qAzLRHaXaGuDM1/UhzpKlKrGO/dR41Wv+52vDQI2D6Uwz
         NfSg==
X-Gm-Message-State: AOJu0YxrzDM3WIl5y1t2+1lZqAGgHti3PPDGJP51mtLDed7o13LN+DHw
        2qce5qB7UyUDwf9UtQbrMtv4Joomn13fDXV05xQ=
X-Google-Smtp-Source: AGHT+IFW8o9SxHfLUzaWPa6cgdJyZJg7DyGK9O9Wy90gSrRCd5zYmWyWB2xGnVYyuabCEtaUMcJbDQ==
X-Received: by 2002:a17:907:806:b0:9c4:bb5f:970f with SMTP id wv6-20020a170907080600b009c4bb5f970fmr15884995ejb.32.1699275624175;
        Mon, 06 Nov 2023 05:00:24 -0800 (PST)
Received: from localhost ([2001:9e8:d5bf:3200::f39])
        by smtp.gmail.com with ESMTPSA id u18-20020a1709064ad200b0099bd86f9248sm4094095ejt.63.2023.11.06.05.00.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Nov 2023 05:00:23 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 06 Nov 2023 14:00:23 +0100
Message-Id: <CWRQXOJ5TFLJ.1NYFSAPXR0HCY@ablu-work>
To:     "Phil Howard" <phil@gadgetoid.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        "Kent Gibson" <warthog618@gmail.com>,
        "Bartosz Golaszewski" <brgl@bgdev.pl>
From:   "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [libgpiod][PATCH] bindings: python: fix README.md SPDX license
 tags
Cc:     <linux-gpio@vger.kernel.org>
X-Mailer: aerc 0.15.2
References: <20231103191455.2441883-1-phil@gadgetoid.com>
In-Reply-To: <20231103191455.2441883-1-phil@gadgetoid.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri Nov 3, 2023 at 8:14 PM CET, Phil Howard wrote:
> Replace the # (which is a markdown heading) with HTML tags to hide SPDX
> identifier tags within the project description on pypi.
>
> Signed-off-by: Phil Howard <phil@gadgetoid.com>
> ---
>  bindings/python/README.md | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/bindings/python/README.md b/bindings/python/README.md
> index abb69da..325c63d 100644
> --- a/bindings/python/README.md
> +++ b/bindings/python/README.md
> @@ -1,5 +1,5 @@
> -# SPDX-License-Identifier: CC-BY-SA-4.0
> -# SPDX-FileCopyrightText: 2023 Phil Howard <phil@gadgetoid.com>
> +<!-- SPDX-License-Identifier: CC-BY-SA-4.0 -->
> +<!-- SPDX-FileCopyrightText: 2023 Phil Howard <phil@gadgetoid.com> -->

I went with a single block when I fixed this for the Rust bindings [1].
But I got no opinion on which way is better. I guess as long as the
tools work it should be fine.

Acked-by: Erik Schilling <erik.schilling@linaro.org>

[1]:
  commit fd25c0ea05fec3997f44d986b2fb904ba029e812
  Author: Erik Schilling <erik.schilling@linaro.org>
  Date:   Fri May 26 17:27:32 2023 +0200

      rust: bindings: turn SPDX tags into comments
   =20
      In markdown `# Foo` generates a top-level heading. This leads to to s=
ome
      weird, huge SPDX tags being rendered before the start of the actual
      content.
   =20
      Lacking good examples, I just took the syntax that `reuse addheader`[=
1]
      outputs.
   =20
      [1] https://github.com/fsfe/reuse-tool
   =20
      Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
      Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
      Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

