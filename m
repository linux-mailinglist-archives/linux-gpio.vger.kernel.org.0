Return-Path: <linux-gpio+bounces-17506-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA69A5E219
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 17:56:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2CE13B1D1D
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 16:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E1B324BC07;
	Wed, 12 Mar 2025 16:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+tvOO2l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999C9247DE1;
	Wed, 12 Mar 2025 16:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741798600; cv=none; b=CVVEkZ41t1iprNPRdIjXppVt2iKJDkuNHOKgGcATrXrlCMTw+FtBm8HyVZcGNckEo6lhbfugEeDB3SI8pQExFPz37YBPJ5MDAoqw/bI7F1UH1zFhwRU59DCtNm6MbWvHl8IwT0C8s0qXap3pIiPmMpdBoIQwGW1nBtbP3hvfwHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741798600; c=relaxed/simple;
	bh=CDMBG7Ofhb8Xcjzw4thNxoeXHKWZ/B76fEVimy8iEtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hkOvD3o9OWRoairMx9gTKb8t/KJjkeawr6kcdJcOfIUurEurEzoMWAFwk8Xi/HjtQIBQrFoOK7W7eQl8241eJUktO7vw2YceI3taBYnLRbxfdKCEleLdRevMO+frfKTTCoZ/VQ5fD/ZqwvRlSAGbunoO3d3kzZCj+EbNZLpE2cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+tvOO2l; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e6194e9d2cso8921532a12.2;
        Wed, 12 Mar 2025 09:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741798597; x=1742403397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDMBG7Ofhb8Xcjzw4thNxoeXHKWZ/B76fEVimy8iEtM=;
        b=a+tvOO2lncqyOuES8/D8gN9hFYNOSP6/6LlCOK2BgdB48gOW4V+byDKSqqXwZ3thZA
         Zgluf0M2VAqDVeAEKm/G8cgsZJhEGLl4t1F+GouVsT2c7tcIQ6Ap0qas/pddPZhGjlF4
         dPPt0ECi+VYgmdpYRkFR76vlXxUvpzagua+M9Sn+JAAy9nDMJ4CjnXECqQoSacC440u7
         fWUIO5JKDOeNLskjTIR1tw+pFmu1ZGDJq2hoCkiZ3b02dGGUNAKboepn/7w9E84Y9mJv
         D3o5zv7hBfffjmpnFSsQq5n7D4k11NLpKp91RTpHyzwy2vFhPmf0BKRO7mIAAhPuB+h6
         VUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741798597; x=1742403397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CDMBG7Ofhb8Xcjzw4thNxoeXHKWZ/B76fEVimy8iEtM=;
        b=uOaVmiCMzY+J9DiiCbrGBKB9hJ2CJzq/zAMi+KucQeasRPNWZhxWEKfLiqEOZEIoof
         UYFntUC2bvBt6BZW7TQMDlRY/APcOnPjvEj0d+jBYl6eVD1ZI+hYN1dJoWTMlF5pxuP4
         2oyQalO8tDkYiN6Ueh1ixlPTAJOMpKIY4TcB+BkZUytnFJE7zyNKVEumOSQb58n+mvGN
         wAMVeicrchKTXoUNaCta8kirpQZwT5UUlPUs0XyooN13fIhqBDOuoM0BIgCKrd5iCGBJ
         jCAeK9JeFnWd2MB3rGFFVqhmUHaCuN40mpA7tnJBcHyQi9VYmlLDe/Eqt89lXupCiXCu
         9viQ==
X-Forwarded-Encrypted: i=1; AJvYcCUg0x3qA0V/Qo7kNicFw8xVzTVM2k2CPhNRkaaUHFneLf4r5/4JeGiqypyOu+mbmO6nlqOoW9URKeaM@vger.kernel.org, AJvYcCW2aZ4e15AmCk1WBWU6aggdIa8+l4j7jc2wNdIrpbIhVOsVy90wcwnHXtNIat9qjUIXra0JoyWo/gNIeW2a@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4ooPOa2zZUXYdoxpiFubOW56M/p516QTVwPiZfq7rfBChG2V/
	aJUBfzaXvmx8I/IYH4ma6FmzcyLSrZ58lCpgRbCY/emlppJ6UVWN
X-Gm-Gg: ASbGnctHxBGQVN/x3EoAuhhCbIc+Ugz2qJprl8skrXhvBZvJed9e5LEMMjPiiIA80Ft
	JwFEKxXMrsmg0329kJ1idSYu5dU4RrmR3TVMcix3JypRM7MQgdXJRjy7uU2w4irx/aY8kmyuAIY
	HEVAx/AOE8g75VJI2rCIzuGB3YG3ICvP5Dvq0I7cZpfB11xxvcOIJqCKAk+/bMznyoBDoycK0ek
	8MAxOucJnUc+WbPmCM5QuC2hHRnp87MPj1zCyqQyUpvM4f+40SBfnuz1mtJKBqteL7R6WVU/VFp
	yvsmQKPcagEB160rK8EEQ1VOruNStFG6WWzxmyq2aIYJqBSLsGz9PFsHQRQ7kIhsuerl36vnSRv
	NAp/OirqJyeYITN42vEex
X-Google-Smtp-Source: AGHT+IH8y8hQv6Sg8xyZcCsQDnuxux9UAtTTC9yU686JDb3h1xpkGSNrZOvF6nGyd/4nw/gseiJziA==
X-Received: by 2002:a05:6402:d0e:b0:5e7:7262:30a5 with SMTP id 4fb4d7f45d1cf-5e7726231demr9291906a12.23.1741798596469;
        Wed, 12 Mar 2025 09:56:36 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c733f8b5sm9909588a12.12.2025.03.12.09.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 09:56:35 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v4 4/8] pinctrl: sunxi: support moved power configuration
 registers
Date: Wed, 12 Mar 2025 17:56:34 +0100
Message-ID: <5869984.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20250306235827.4895-5-andre.przywara@arm.com>
References:
 <20250306235827.4895-1-andre.przywara@arm.com>
 <20250306235827.4895-5-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 7. marec 2025 ob 00:58:23 Srednjeevropski standardni =C4=8Das je=
 Andre Przywara napisal(a):
> The Allwinner pincontroller IP features some registers to control the
> withstand voltage of each pin group. So far those registers were always
> located at the same offset, but the A523 SoC has moved them (probably to
> accommodate all eleven pin banks).
>=20
> Add a flag to note this feature, and use that to program the registers
> either at offset 0x340 or 0x380. So far no pincontroller driver uses
> this flag, but we need it for the upcoming A523 support.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



