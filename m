Return-Path: <linux-gpio+bounces-30185-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61ACDCF7612
	for <lists+linux-gpio@lfdr.de>; Tue, 06 Jan 2026 10:00:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D000930124D4
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jan 2026 09:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0045730BB86;
	Tue,  6 Jan 2026 09:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="S9/t0/fw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D81F30BB9E
	for <linux-gpio@vger.kernel.org>; Tue,  6 Jan 2026 09:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767690027; cv=none; b=h0n/r1cQJztxUiCXqhSRigIV6VGub9vVAQHvWpukQNU+CmLQZgSVty+PTdpukTw+WvgNI24uOXk3+9IqZhuIODwl39bWPTdDXPmpJyaTZrFyphKXz9ubLF80cxVhg/1Pd5ptpQ2+pITPCuPhIZ4L1wUyJaCpX7ttZWP20FVE2yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767690027; c=relaxed/simple;
	bh=nwFNEOi92EKNgQwkvVK3dDTbWUcm/1bDSpbc2qb1f6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KIytB06AbefA/trisU1lsB2AnAlpsiP/4OT5w5MUznqGDlHxwK5+ics3xDCPjjJ8RKg/W9RnwGMqIpg7ueg67DR30NMR7X6+62G/IuooInv+Sk+p6cIZeIPFalsh7XquAvBmrK8a42IrVqJ7DEWoPntqIlUaReS6TtPxAkV7UwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=S9/t0/fw; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a0d5c365ceso9393395ad.3
        for <linux-gpio@vger.kernel.org>; Tue, 06 Jan 2026 01:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767690026; x=1768294826; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwFNEOi92EKNgQwkvVK3dDTbWUcm/1bDSpbc2qb1f6E=;
        b=S9/t0/fwliOznxccDwrin/lZ9nq95gy3SIjMho05jYWrcx7BdsPu/FTLgUdlCxO2vl
         pgS8t0U0mi4aqSsJfnV3LFJuX7nRvi5od68NShPtQv2LGA/kHwmmTPl/Yq1GgHFVXjIt
         AVPYdbJMseOYatM0LO5LpF8PbhNQsTBlDQpUdUUH9ceDadjIC9W0CQGEO0YAwLyb6EDe
         y+PhDPCrlMIoTXx6nVlRzMGZizTMu1YUFcRWGmeHbnSFSH/X5gep7Ujb45eYy5cGLvMA
         n2vFzmlOWPyYYL8mgvhmRRYHM01OoGRHyqHBQqSNm2QmpVi3BDzgURSY9OhJpmWobkV2
         /WLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690026; x=1768294826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nwFNEOi92EKNgQwkvVK3dDTbWUcm/1bDSpbc2qb1f6E=;
        b=LgvzHhQ4yND9yG2JT/jtMW4tebesbSSjubV1RGCXUQSaffV0M/Uh9XfkhBFE6K08Xx
         SxbF4HTf6g1EtAC1GzrcnMjGyppfx6qhcVI4YnIkCSOCwyNeAlIxu5n5bKARKUJbogka
         +2jLql8gxlSqr5lcxHLV5MdLwmAUp6fdKH8kCHqu5nqwFya7wDvoMEthli5zvaD/FbCb
         qVnjcQAy5oEwEWwp1AkyQxw8aLOoLgnBg9gqyTZUiKQqCTeMSsgKKhXJdUadBsYuT682
         XZMvRcno7rz/QMj5UgTvaoLTxr9Q9juf4BFin5q+tghThwPTbBwTuebTzMbi5Fr/4qiO
         ATrg==
X-Forwarded-Encrypted: i=1; AJvYcCWJgBj+V+Fx4htId9GZkjgsrrtD91uLakHV1nDEpUaougfkOqD6dcIrzT+0qdcrATOu6alPYb2FeQWK@vger.kernel.org
X-Gm-Message-State: AOJu0YzpY97WRrwBm/id1ucQXMrtnfpvcNUXEFitoN0ZV9MC2SCmR8Lz
	314q3EJR0dE4QO5iAOVZmJ1p5urzMOXbTmp+HOx+oKZjI3Xmyc7Ftb8SAFmQLgG6s3DIYaL/fuk
	j/LsTDYuUxejGiY1oxMXGe12tORdwmCA=
X-Gm-Gg: AY/fxX4W/sXx8FLm4IQwhJA3Fklm1TqdDc5W9B5/V6D5V/k8uOKu8d/0EJG0XauJXLm
	635PIdvM03YdhwGPnUioEX7th4CD2dPuqR+Ct79jg9qQp+IU8ZXebkU2FXRwol4s8HMsq8R2GnR
	RInkMynQ7/BGS6+4lH6kx8dqVDGV/TCGn39Mwzny6LSvPe4ZraehlcybGtDsiK3pw+m0V8buxvx
	rR/ziG7B83bQ8ZrbXemK8Lwmzk7kDrTAPiC+OhNmDPIbrGAScG7bOwnZv18sAt2YMbdkK7zD68e
	JzjYLZqREl6WdXjbPRJJBDp5DVI=
X-Google-Smtp-Source: AGHT+IFykSIhDbKg0V1WBCg3OR8KUafZJ8yy1m4E2Hl9KGFyDUM1qo6fuvxU3JjJJxoh2Jqu0ofEIeBaRu9XHRBaHZE=
X-Received: by 2002:a17:902:d491:b0:29f:b3e5:5186 with SMTP id
 d9443c01a7336-2a3e2d569b1mr20878775ad.56.1767690025591; Tue, 06 Jan 2026
 01:00:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260106085520.21129-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260106085520.21129-1-bartosz.golaszewski@oss.qualcomm.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 Jan 2026 10:00:14 +0100
X-Gm-Features: AQt7F2qGoX6X_u9x7RpkJNN1v9xaEp0mgqiOs4Qpk3zn2K1E2c6w9PHm9V8_KnY
Message-ID: <CAFBinCBCxkt1F5NUaAWjWnudLvTnmEMw0sdJps3kN=ibCEicSw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: extend build coverage with COMPILE_TEST=y
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 6, 2026 at 9:55=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> We currently only build these drivers on ARM but there's nothing that
> should stop us from building it with allmodconfig on other
> architectures. Extend the build coverage for all meson drivers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

