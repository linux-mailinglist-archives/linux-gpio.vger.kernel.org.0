Return-Path: <linux-gpio+bounces-24806-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94844B318FE
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 15:15:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EF783AF3F0
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 13:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D3742FC03E;
	Fri, 22 Aug 2025 13:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="InHh9jKb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F1C2EDD66
	for <linux-gpio@vger.kernel.org>; Fri, 22 Aug 2025 13:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755868184; cv=none; b=KmViU4ji9mQTi33Z69jXCuOVjBWwVFFYfpvZGq5Zup9oX73lKmzVHgV9UTxh6VV0hgeoarNEGtYZ8nxMrPbLzZgF+OC4uN3zU/dIPV34E2WadReuRVTp+QNAxQzaSS5BCdh263kV24l2/veeDY7y3ewt9U+vT84rjLJxMViqSbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755868184; c=relaxed/simple;
	bh=aaAUnNBQO1VRtLjO1YXIZilaY2y7K5KoxfwlKFSif3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PHiFB64JTSENXjv9iEciSQ8/Epz7/f3fakyR+86lsP+wWMP4zjHXSdhIt2ne3XS1Qsj7IxmBuTBIvCco0tgHvC79nYu255rJS2Te9x8VpBpSDLtknERxPjMJT1xoFrlzQSicaCz4L2JATWIErC3aXNNOjeSTMqs7dYWcV9e4WBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=InHh9jKb; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3354b208871so14459381fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 22 Aug 2025 06:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755868180; x=1756472980; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aaAUnNBQO1VRtLjO1YXIZilaY2y7K5KoxfwlKFSif3M=;
        b=InHh9jKbohUyCVyvKp8wVyL/NKqIyKmuh0egmQ3CytVHZGc6g2CraCAPZB22K2v7mu
         hiiWaBbmxVXcPSCqHhyMEA/MZ1hf2+lDy79O71+ZzTTj19wnXbACv4Ygm4nBU9CmI61U
         cPtxTQTBXYdAAiz3aogrjXjxZQbxZtrTN6rkLcCqvV+L1KynCfNQ9gJURHuDc2ofui8/
         HMS00CswMEjT/BspDGFFIpDhc9DEm+0E1X/FCbpHm7E8TRqV/q/f8PDQU1HdNjzsCyGT
         KMZssyudgrnJbXgy/BJ50vZkip15Nw0Bp3/JZwy/32sBlUYqxk0lrkv+8KMX1U90dmqY
         ONJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755868180; x=1756472980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aaAUnNBQO1VRtLjO1YXIZilaY2y7K5KoxfwlKFSif3M=;
        b=Q1dp6q4YQIlY4ytnFdP93E9spPkNPQPj279mILYKBs72EGAFW0jzoTQKGX34rM21te
         IklfU9qKZ6y92IhtrBFezSZEN9+qJNhaYsM68cBTxDmBC6GYUWuc5nporo6CH25ym7Oj
         xfPvRtl/rMxP5AQ5hHzAorEKmQTs9KfDMk9g45PUHs6DpAI+JaGphp7K7VqHag5OJTmf
         I0Am5vW33fEg5AABjuTi1giYCQXhIGSOuWhQMDJkRbYWDx1JdZUsksENpuWD7eOcJnps
         zOBBqLa8aGt0o6JSVhCgDjNXkEcP3vchhBtkh7d5Z4G1qiiUew5jLfA4Raxk4wKY0E+F
         c9mg==
X-Forwarded-Encrypted: i=1; AJvYcCVxxFXbWKbQ70DrVK/U2o3IY4MgeN68CgWsjJzbRH/mReWVDrHn4FWLIqaVTjtSwtRbO+n1LKSsQMjb@vger.kernel.org
X-Gm-Message-State: AOJu0YxVckuyla+qROfnTJao3IWUHIcK01fAQzPjtMKaVpylolG9jIIm
	65X4m3E3h1ujH0KPdjZbhpMmoOWYzy7or7F8+g606wCWAW6/X9OmyR6+Qh+wmMuLIxE1wSi//Ia
	Ch6PtuQF/YnNCzAE0rOsvJnBiD164WSP7zDzN0kQg+A==
X-Gm-Gg: ASbGncub4I1b6jCZp6N93cY9W14Mn2IQ/9/3NrqGYdHnVpzg9fUvZzOU8/z0n8dnPcU
	5MeB/MWN8q55y5ktFyy7KeI5wWvd5HhgOz5CPHdU1HB0LOQP4hWKKg+ORiCnI6fcf7VxDO7BwWQ
	EfBQWPMwgXBDYkhMcELAHmLTvVzfKm4V/cmm0UL25v0iw2wCj4XCdMsxfnvxqYJj7R3Nb0dda+J
	gtVgVo=
X-Google-Smtp-Source: AGHT+IE38aK14JH5doGJwJ/L1zggU/pkge8LUJowEiyqKCoskKkhAj74fv5SRzqMHcI7hWw+wLFl8EdWHeb5F4Wq9Gk=
X-Received: by 2002:a2e:8a86:0:b0:32b:6cd3:3938 with SMTP id
 38308e7fff4ca-33650e433f0mr7211421fa.13.1755868180212; Fri, 22 Aug 2025
 06:09:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250822-airoha-pinconf-err-val-fix-v1-1-87b4f264ced2@kernel.org>
In-Reply-To: <20250822-airoha-pinconf-err-val-fix-v1-1-87b4f264ced2@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 22 Aug 2025 15:09:28 +0200
X-Gm-Features: Ac12FXyilBE2jL31VnOTILlWWCkKRSKs1Im0EeZ6mew8D2IIMZNOLHho3Nv17MQ
Message-ID: <CACRpkda4m8awDHOwo9fRj3dxCrGp9=pDYmV5N0qTw39a6-qQ_A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: airoha: Fix return value in pinconf callbacks
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 22, 2025 at 2:14=E2=80=AFPM Lorenzo Bianconi <lorenzo@kernel.or=
g> wrote:

> Pinctrl stack requires ENOTSUPP error code if the parameter is not
> supported by the pinctrl driver. Fix the returned error code in pinconf
> callbacks if the operation is not supported.
>
> Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Patch applied for fixes.

Yours,
Linus Walleij

