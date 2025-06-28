Return-Path: <linux-gpio+bounces-22376-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9053CAEC4EA
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Jun 2025 06:39:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E4561BC10FB
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Jun 2025 04:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88F1D21ABDD;
	Sat, 28 Jun 2025 04:39:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECAD2BCFB;
	Sat, 28 Jun 2025 04:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751085576; cv=none; b=GGUxyAVFc5+Z1v0I5cMG5xvm6tGcW+xA8YIdw2GniIOMS8QoGsnZ3ErlNTrfmycszWdsbtFFTmFWr5PDTetaTbefTDKLhEhH0jjhCirtyS9J4ojLs/c4tFYY8ieX35SiZiBCjltwMSUZjA9CcBzeQ5Rtap88YCZ7C8QtQL5MNcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751085576; c=relaxed/simple;
	bh=XjehE0byLT6LFQc5LPjjr+h2YCj0kTxyUsbUd1G/6bU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tZ9VVxIN8LrCs9FvwxJbnTW+rHpA3pFmleof18qBc1ES2V4h5wjJtcozELsMrtfoZp5nze/wajSnWLE0CqLGg3XqjJq0ptm4DZlhRm6SSOJF7smSe4RvVtaGoc6JgqPFAjVK8HtJgHgQAm03OrX7aF8TsMNHLdaIdK1kZWN60Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553b60de463so467871e87.3;
        Fri, 27 Jun 2025 21:39:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751085571; x=1751690371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XjehE0byLT6LFQc5LPjjr+h2YCj0kTxyUsbUd1G/6bU=;
        b=p/Zer3j8XrqONRsrWxsJ+QDpVP+W4gYdRNE+0MeZR3RKbQn3jVYgfCIQ0FVnzGM45P
         XfGZcCcn5+4nWtgGao7syBA7K0Sc212o+5BC/TLLQ2CAxKBJNHJ7efV8km+ZAlxDJ27h
         MpsepZCuYySCpN6btpKK6dGZifFdX+8iaWZdFk0Tfwc6NZAbb9xmAPaP3+hI6BgtZJrn
         5c1ezTjUkLMcU8FTcf8kVf4x5qmebyVi+B5UR/gvOKbnA5K3NV/gYQ5GyUpE9oQMp4Ii
         t9D6qmK//0adBuVtXfw9wmtHKirAt7Z5Kzk2MXAQRQt842kC0bu7oynhkIEW7P91xCQU
         GLxg==
X-Forwarded-Encrypted: i=1; AJvYcCUgGjh1GtlCPaEpBB8RObw4V+/4+TEvw8PgHhZdA/neCfmRoNRhsepx/W9XmEHzBXa6ogjooaV5oJ8feg==@vger.kernel.org, AJvYcCWHjFPnlpup/lIOnDpgKA5BRzBDJRSeOycQZcRSq2inGnOiu+Bg2h7/ncwXpC1OMcuXm/gkc4DMQ3VJ0Bga@vger.kernel.org, AJvYcCXqjDtLH51BVUGqiRtrPTxRIz3T2Gh10AZNCcrDCrhSzWYsFuNJktJqX8yDHkoyvGxMRn6bvcY1FmDe@vger.kernel.org
X-Gm-Message-State: AOJu0YzOx6ZapciUVjSFtGjqnBAcRFMspUkKE2PmLlfb43nWqkFPeM2n
	Xdk7Hkl5tu2cHGQTw+Y3V/7oWKJ/GZXnJ2KV5mPYeAlMj+MiWBRi5dRb7DRQ87Fa
X-Gm-Gg: ASbGnctoSko77ZN4yh570o5eg0Gq+FPL4Cyd3o733IXns+MlT4MtDrUY81P4jmNx/zR
	G8QanuzSv5wuQch/zZH9HSwPFRQc9vX5tzZ+c60xqE3aWk16pnNG7R8TwIawAa2qOSiqUtfvPCc
	3recUpL17UE+c11kmk8qpfuBZAZvffbHrZyq+MAIs8fpx24jglRTlF5P4ZfnTylwhmpBQAw7nO7
	IJ0J1FrpU+GTMY9UO4/0TgIWeuLsoSbYNb8boPBiIGRYRPZxuKf4Aa5M41epJ8oo6yHsmPMOWms
	5TYSv/sdA+V+MXNDwrhNgZK3fPeGMJafSvuZUMjkfa9mFpN4BOzhbvOCDtEpang6fc81Zrq0jCo
	+9AKmI18BV9+Gaekd7dLqKtlB4oYY9A==
X-Google-Smtp-Source: AGHT+IFAAFdqx0e30R4m2bLiTy55BpIjGpeKnNOchkj6cDxL04RM+oDcY0i0orscnrqx9ykTtykybw==
X-Received: by 2002:a05:6512:3ca4:b0:553:5e35:b250 with SMTP id 2adb3069b0e04-5550b8d27demr2212542e87.32.1751085571245;
        Fri, 27 Jun 2025 21:39:31 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2d7c35sm663358e87.205.2025.06.27.21.39.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 21:39:30 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32b31afa781so3794311fa.3;
        Fri, 27 Jun 2025 21:39:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVhTowp86Owi+yOBdFTcXSX1Y1R6D4xZjHSWrET2l5nmaCxS5JRAPlUVUcs+40UrslmUuKR//bnqM1ko52N@vger.kernel.org, AJvYcCVl8BU9hOmJEfWRCmn1Kp2fJXgZRA+ULgmdWKhOvVf+RHIpoVWcjurwNea5vpHrnlPTsdIRKgr3zXBhug==@vger.kernel.org, AJvYcCXd31eaOjHL3evfBUEu3sn7lnd4Fc25WdrXzekGxVMB4qjbB0Y6U/hfOxp3OE6khvQFXGLs/TpbE03A@vger.kernel.org
X-Received: by 2002:a05:651c:304f:b0:32a:6c63:935 with SMTP id
 38308e7fff4ca-32cdc4480afmr15261101fa.4.1751085570044; Fri, 27 Jun 2025
 21:39:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626080923.632789-1-paulk@sys-base.io> <20250626080923.632789-2-paulk@sys-base.io>
In-Reply-To: <20250626080923.632789-2-paulk@sys-base.io>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 28 Jun 2025 12:39:17 +0800
X-Gmail-Original-Message-ID: <CAGb2v67VVc4ckvzy+w++wcEUPSvV9Uxju2H4qTRNhjwAgYpzXg@mail.gmail.com>
X-Gm-Features: Ac12FXwd7he7qKrnxN9KLQmU6bishZKuh8vNiwYMugN6VxIMRflq-7o7dltAy1M
Message-ID: <CAGb2v67VVc4ckvzy+w++wcEUPSvV9Uxju2H4qTRNhjwAgYpzXg@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: Fix a100 emac pin function name
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 4:10=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> The Allwinner A100/A133 only has a single emac instance, which is
> referred to as "emac" everywhere. Fix the pin names to drop the
> trailing "0" that has no reason to be.
>
> Fixes: 473436e7647d ("pinctrl: sunxi: add support for the Allwinner A100 =
pin controller")
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>

Acked-by: Chen-Yu Tsai <wens@csie.org>

