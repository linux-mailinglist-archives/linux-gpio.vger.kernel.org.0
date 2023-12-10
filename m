Return-Path: <linux-gpio+bounces-1200-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0AB80BE3D
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 00:36:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BBFF1C203B7
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Dec 2023 23:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D6B81DFC6;
	Sun, 10 Dec 2023 23:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lJTndi+i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17F74F5
	for <linux-gpio@vger.kernel.org>; Sun, 10 Dec 2023 15:36:37 -0800 (PST)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-1fb9884ee04so2775935fac.2
        for <linux-gpio@vger.kernel.org>; Sun, 10 Dec 2023 15:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702251396; x=1702856196; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wwhdaI8XBubSIfRfAPI160DRLkTYdL3p80yUVHWP+lE=;
        b=lJTndi+iTR1mYF+vqJ2971iNv1s0v7W1CsqA33HteKDeGoo1NLcOD/EcI6GMXSMTCe
         DlSqcLTDBCa0DyX6YM7RxgoF7JldUTXElfAZyM5p/kBCxXUBXuw+sgkhcg86rOO1xILm
         VQqkJlBxVWw0GNygw3FFXD7UqZ0NqkzP9Jsz3HbC4WqSGZheCwOa/FvWPu/tJCcTfhaS
         StsNaqRrrMaYC2Vi7e9bvuyGuQT0uw86HB26rSLCcEIbLW93UMuBQfUbVmeobdk5OxCw
         rn2/m+hVUmV9vb3AIB9Xrjrya5gSnRpjq2DQsMdI+o0I5L13mat5hum5V1C+Ik2HPryD
         dUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702251396; x=1702856196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wwhdaI8XBubSIfRfAPI160DRLkTYdL3p80yUVHWP+lE=;
        b=VP9hzbrvWYG6hHSEO948P3dMukP+/0W+lz6jqIjXXD3T8iLOTi6hV/hwY0c8YwRdpO
         29YMN6UlqS8MC9hcy0Rx7Mo9NOqg+TNLUdw27+6L7CgIc0jBXtiR6pYxR12B7O7cgtqv
         Jrzu9XBcpcnILwRZDO1rz4CNwG8QTxigHEeb89RR5J2Q1khhvmKuobgWJsooi395OwSx
         x3e+bfxUI9pFYCI+d5CrvD6o1xt1R3xyu9jwygvWaqj3hD+xuJc88atmxCqoefxp9xHu
         bppRdHenoK1Q4NGV/zDMYtD5aHn5WsA0Ad9/BEeoWh8IMd2I0i1tVlInBM2yrSMQQ7aU
         3XQw==
X-Gm-Message-State: AOJu0YwKVSueTnVhDdL9CFdWIyz6LvS7iXcx5W2005Az//mawBxcpdog
	VyYqWiCKs3BMo+QBfaghIQc2StlX05vmuzX1PHkfbQ==
X-Google-Smtp-Source: AGHT+IGBq7mUtyfHbN3TWy9RKPBEUdVZWqEc908zIBJVoQI53SI1IAvfmzEwWNQNMlm9DsxGtd8LX7ARxtptPsEGI7s=
X-Received: by 2002:a05:6870:4f13:b0:1fb:75a:de7a with SMTP id
 xi19-20020a0568704f1300b001fb075ade7amr4086371oab.104.1702251395847; Sun, 10
 Dec 2023 15:36:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231209233106.147416-1-peter.griffin@linaro.org> <20231209233106.147416-13-peter.griffin@linaro.org>
In-Reply-To: <20231209233106.147416-13-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Sun, 10 Dec 2023 17:36:24 -0600
Message-ID: <CAPLW+4nuYHbLuLX=HGsDz6WYtZV3P7yBEmhCXbLW2M+dF1asow@mail.gmail.com>
Subject: Re: [PATCH v6 12/20] clk: samsung: clk-gs101: Add cmu_top, cmu_misc
 and cmu_apm support
To: Peter Griffin <peter.griffin@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 9, 2023 at 5:31=E2=80=AFPM Peter Griffin <peter.griffin@linaro.=
org> wrote:
>
> cmu_top is the top level clock management unit which contains PLLs, muxes=
,
> dividers and gates that feed the other clock management units.
>
> cmu_misc clocks IPs such as Watchdog and cmu_apm clocks ips part of the
> APM module.
>
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> Tested-by: Will McVicker <willmcvicker@google.com>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

[snip]

