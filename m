Return-Path: <linux-gpio+bounces-71-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 742487E9E4C
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 15:13:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 713EB1C20934
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 14:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07BE0210EF;
	Mon, 13 Nov 2023 14:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SCpnL32G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA88210FD
	for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 14:13:09 +0000 (UTC)
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 061F4D72
	for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 06:13:07 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5b31c5143a0so51381577b3.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 06:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699884787; x=1700489587; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j6+pycgnZG58S2WudqRgu7/urmppv02RyU1W64E8pNI=;
        b=SCpnL32GK+p3zrPuNfFVG2CUz5kOcnK38UNBcUPb7HX6i+1WeWRW5z7BNYzSJHc5Bl
         /vU+mWc3461SlG2OTWALe2mRMB0NH+wLoBdOOOkjAPnLn7Vuvtq9k8Lee9HJxoF1JDl7
         rwSLfL7qd08KS68QzX3WwVClNwibjMg4rp15r4Ad3y9MYHs6cWobhSAFSsHvg+RsT9FC
         Zd62KWjTEf3UPSz/r0TtnhQl7Zg5QWsBVwCXllwWjtEJCf2pgFPD9qz8L0aMJD5qdAcZ
         JDTj9O16lrt+8J0gBoIQ9FYaE3bdj8QLHLZplmXwSRAb5cxAD4LCI4MooKlqHwKn3nND
         fFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699884787; x=1700489587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j6+pycgnZG58S2WudqRgu7/urmppv02RyU1W64E8pNI=;
        b=oNw40oeFvArY4ozOsYqqEq+i0UlfP5mBfRhig64bVaVBX4dAYCMd4IFOGK57TBYh90
         5a/hDe5QQ7w3m7MAHh8IQAFVMr+oTaKGUqttBk0jMN+8GzLbkbShMRqlxfwYyNNYN7E9
         tNXcnuufknOkLOrIZ58kTToqjPF4bKGkcvP2GtRxciK1ytU3B24soKTHjYnFBBPOBCZP
         r+mPiHv2gI/W+zGucvAzTbyqYskFTWTNXpKX9IpSL34/cfMphxhXdFNFMGPd9GFrmBS6
         WFCdE/s+JTY8TSHLnR4+2KYkjLaoWnexj7jfQWL/K5z3Dwzr9KLkeT1X4WiZfrXAlrc3
         fjrA==
X-Gm-Message-State: AOJu0YzEVAbqUTjWdQmgEUyZWjoQ+xCVC35xdxunfDkoMHbeQQce1ZVB
	bd3rPQ8Ys7eF8sBE2ktzkjimVFkJuZZ1nR7iknJnBQ==
X-Google-Smtp-Source: AGHT+IGD26Kjd6X8qP+F+2+1/G7gpSLJN4W5nonKQd8XlGJZqGmUhTtV0CPqPtSKJ5F9k1AZ7XAeeH4NgiSFjX1VrYM=
X-Received: by 2002:a81:6c54:0:b0:5a8:1ff3:ef96 with SMTP id
 h81-20020a816c54000000b005a81ff3ef96mr7595283ywc.7.1699884787153; Mon, 13 Nov
 2023 06:13:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231031080807.3600656-1-nichen@iscas.ac.cn>
In-Reply-To: <20231031080807.3600656-1-nichen@iscas.ac.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Nov 2023 15:12:56 +0100
Message-ID: <CACRpkdZdmJQPx7-q0QY7=TpSDxr0W1md-sGwbKYc_kbCdEmY4w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: stm32: Add check for devm_kcalloc
To: Chen Ni <nichen@iscas.ac.cn>
Cc: mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, robh@kernel.org, 
	geert+renesas@glider.be, jernej.skrabec@gmail.com, valentin.caron@foss.st.com, 
	bero@baylibre.com, dario.binacchi@amarulasolutions.com, 
	linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 31, 2023 at 9:09=E2=80=AFAM Chen Ni <nichen@iscas.ac.cn> wrote:

> Add check for the return value of devm_kcalloc() and return the error
> if it fails in order to avoid NULL pointer dereference.
>
> Fixes: 32c170ff15b0 ("pinctrl: stm32: set default gpio line names using p=
in names")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Patch applied.

Yours,
Linus Walleij

