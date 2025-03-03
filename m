Return-Path: <linux-gpio+bounces-16971-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA75A4CC3B
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 20:52:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACAE83AA654
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 19:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A497A23498F;
	Mon,  3 Mar 2025 19:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q3C7Fn64"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEA7230BCC
	for <linux-gpio@vger.kernel.org>; Mon,  3 Mar 2025 19:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741031510; cv=none; b=hRWZgfuXg7KDO47bnjvRX72yyE0lNVN1yEVeNf5O0GsgjVOqpCH2fdYKszgb6sr6YebnvejaNFnQILLJMX5XqZE1ibD/Ew2wrO2zNOky2b+Mhc7wySpWwriDGpBdGUzXU2HNxYpxU7eab7+CT6S7subG8dSAerXZGjIksHXp/oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741031510; c=relaxed/simple;
	bh=GsQ4AlMHXflwhjl3qlPbMr5mgvvbV1JUiFvFXS4uYGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fiXRk/1RqQafooQUTo0xx8Tjmv1dBPG6u5S0KBpz6J0uutAamOdpXzVwP15KL6UKVww3PvqAH1ehsSHNoa1lejXGhNyddQ6bg4TzCt3pVHkv97szuGZqLjWBjOeVWQ3iyGKx051nlIXLUPFjkzE5E+SUzLK+XiVM7/+d2S1BE+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q3C7Fn64; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5497590ffbbso181415e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Mar 2025 11:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741031505; x=1741636305; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YOeEe/vKXmfGXFSe4NXDP7rT5PatmaYJmBeo1VUXgeM=;
        b=q3C7Fn64y2JLH/pjzso65AhmdA9PZr8/Mnc2Rbg666gGcfMoD7MELHt7Q4vqPovuhY
         3Ny89+/JGVfkJFUL0arRtdihgM1uqn9YUhr8Y9LLgx2Z2xK9IemRHM5BNt5sEh7CHxPA
         0pE6mbQY2hpnA0sxMZnE1JbH1LPZIXEjyjo2ey0AHOD1RtlwojmWmiQSTPVlNQbotq5I
         rfK+rGnb+D7uVMrGogozAimvBdxTPQZYTtvcZUj2eFO7DLCtnu5C8QFpaXJE1AtcECkl
         M7npQKwglNKyz3cB5J5kdaxLxc2lM2dX+1CPCUWvos/8vyEp1jeCCzYIHof1KIKU8BAM
         onfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741031505; x=1741636305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YOeEe/vKXmfGXFSe4NXDP7rT5PatmaYJmBeo1VUXgeM=;
        b=bX+YRsmvXzpMqsX2XSI30PsKukib02cF3JQcW34debU2hjDM5Ibhra2jwJP00DbdE5
         6WxWC+qHJ9deeVT2XztZGZ4R44dMqucRD3FkQHRdEyAVFi7w92qPfQlQPTO/zRl4Fz1x
         +9sH4S65V8n+eLfk462Jgu78/Gb1yBMqRaE29CSaiufRMfvDCIeNA0kG2UPV8rDRICEF
         NJvGvFNec49FOZQZulT1OIBOHXcAU6QvzlXrQRjN6I5zxDNztKuQM9g7QQKLTmSN5mHb
         jJa7raeX9o/UekU3wHZlh1Qn2Q9K8ThhQ9rq5amliZhn965Zw6SxBdG9G8SKb0TgRVAU
         3d/g==
X-Forwarded-Encrypted: i=1; AJvYcCXlJ/a6WhM870p03Q0/P/C2WUPbAZikQq0ATRH/Tqyz4ffX6iTU0uiIKAnJMskiiExRGraZ7DEvxIu8@vger.kernel.org
X-Gm-Message-State: AOJu0YyLpxAFmU4DTCxUj1nX69yGr+W3muyFsUA/RcIQSQ3fzL88IDGb
	J37GwO6vadoww0TrtN62JpXqZxvAhum/LvcTEv4Oidphl8vn6AjRHVwwERdujckbBkNg70BX3ZN
	B4I9J03KX4QwFN3luM2x/eEk/Mx3dDha8tnW29w==
X-Gm-Gg: ASbGncu6OxdYl5hG275dB1AJ/vDL1Dgyaqb8lcQrBjS/0JSk8YvbGP6Q88wFhE08G1C
	14xBOa+6CB4vRx3XHjO4vA14UKIoNv/yKUHq2Gl8VlITMfH8XhroFm8HAq1bb/HKMur/ftLHPoA
	fYF93ojAM7qJUq7lJQkFbScVTKeA==
X-Google-Smtp-Source: AGHT+IFsGbvesnjWbfEk8+qcnhMhpwSK7rY1/+23lfk9h761ve12/onnm+C+Kg2oHwbcpQo6jWrgj2PsmOSffLjO+Lw=
X-Received: by 2002:a05:6512:124b:b0:549:7145:5d25 with SMTP id
 2adb3069b0e04-54971455f79mr1443819e87.34.1741031505444; Mon, 03 Mar 2025
 11:51:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303164928.1466246-1-andriy.shevchenko@linux.intel.com> <20250303164928.1466246-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250303164928.1466246-2-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 3 Mar 2025 20:51:34 +0100
X-Gm-Features: AQ5f1Jr4_oqgGu33I-byOxU2dX3oyVoLqRbYUQ6KaoKwKXnjUNMYEaKqTtmoBw0
Message-ID: <CACRpkdbm5RQ-YOAaU7Mu2dyEjM12v8mP7rTTmW9-V5EbOPTJPA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/3] ieee802154: ca8210: Use proper setter and
 getters for bitwise types
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-wpan@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Alexander Aring <alex.aring@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 5:49=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Sparse complains that the driver doesn't respect the bitwise types:
>
> drivers/net/ieee802154/ca8210.c:1796:27: warning: incorrect type in assig=
nment (different base types)
> drivers/net/ieee802154/ca8210.c:1796:27:    expected restricted __le16 [a=
ddressable] [assigned] [usertype] pan_id
> drivers/net/ieee802154/ca8210.c:1796:27:    got unsigned short [usertype]
> drivers/net/ieee802154/ca8210.c:1801:25: warning: incorrect type in assig=
nment (different base types)
> drivers/net/ieee802154/ca8210.c:1801:25:    expected restricted __le16 [a=
ddressable] [assigned] [usertype] pan_id
> drivers/net/ieee802154/ca8210.c:1801:25:    got unsigned short [usertype]
> drivers/net/ieee802154/ca8210.c:1928:28: warning: incorrect type in argum=
ent 3 (different base types)
> drivers/net/ieee802154/ca8210.c:1928:28:    expected unsigned short [user=
type] dst_pan_id
> drivers/net/ieee802154/ca8210.c:1928:28:    got restricted __le16 [addres=
sable] [usertype] pan_id
>
> Use proper setter and getters for bitwise types.
>
> Note, in accordance with [1] the protocol is little endian.
>
> Link: https://www.cascoda.com/wp-content/uploads/2018/11/CA-8210_datashee=
t_0418.pdf [1]
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

