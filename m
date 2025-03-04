Return-Path: <linux-gpio+bounces-17008-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B14EA4D7A6
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 10:14:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E73218849A1
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 09:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F021FAC5A;
	Tue,  4 Mar 2025 09:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pTDPe3Sz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61AC1F5404;
	Tue,  4 Mar 2025 09:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741079507; cv=none; b=tDdVkmzUei7/QfSOfziswkEoH9IoyH4jpG8u6Yx5+U5kPyR7As9zpsPKzNO++CeTQmxfUF20dAtKwUs3bmRdLC1wbo8vTYbKEO6CYNf6IG6HHXLSv1yK8P4dCbSWK6K5qp8RnQqYhW40av2uIOO1iNyuRhctzmYCHkPXYF9zfs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741079507; c=relaxed/simple;
	bh=d+d0C1+Evp1tTj8t+lX/Ji2f3+9xo5brEkgfzdJtkko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HxSaRyV3QNbrYJtLn/qQYxW94AmEQeWPLicdwiKF982pLUOpFo6xHIBtIdX/ccC6WKxiTfgdSb5MOi7EmbA715fq2oLQs7oNPxc6nDeQbsbYKIGSlNbMphVw0qQmE5XPeC+k3gUBplOSCGNK6IAif8y6zyrw2jWBOQHRCFch1xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pTDPe3Sz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58197C4CEEA;
	Tue,  4 Mar 2025 09:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741079507;
	bh=d+d0C1+Evp1tTj8t+lX/Ji2f3+9xo5brEkgfzdJtkko=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pTDPe3SzqaoHNye7XnmJowfZmfekkTzUsqLXXhIxYTKCWmSDERSQ+g7rB62dclgro
	 QdUNPjMX4wybjy3Cz64neKzA09bM/Er6Hc37IVh/qSU0WEWcgAZVBK/3fVakr24IIM
	 fzfwcCtok6GKyjg/sGdAS0UcvFOagxVjqBqoHue3gv5dN6VEybpL8FnXotmWr0nkQC
	 e+dFZa6Y8SP/5FDlKVDb6aOGSyfowe/2erP0Mz403Sv1rq6qw8v6HXU6ROOt1LkfGi
	 nsyzhWxdoZ+u6tWKpz1Dk9gyz5Cdu9IDTFMhp4Rs8IyFTaaWEZ+xbv/cxfqlDt2j16
	 yot9CdaNIG2Qw==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e4cbade42aso8088563a12.1;
        Tue, 04 Mar 2025 01:11:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUy6/NMDaCXXXFvDAg0mW38erhs1+GPMUNtZFsTmqnLC93hS4bPpX7N54J99P9pfMYG8o/9lwsfdJjI@vger.kernel.org, AJvYcCXlcu2HzPceWDijj2gSVjpiQm963bxNVoFs4w10Bz9lwRtv3YQ1CDN7DC7b1qQygxd/AkS1d5oHmmdMTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGflrhO/b7+QcXeTUrnP5c+LCIL9uybhaUIyLDHWnJxpsNtKCB
	vlrOGpDOHf1Wx35ElkYR2saSBLtBhrv8+POEEut6dGZtzHgTTGSLWZMOsbTFxqWaZAkwH9mI2Vm
	/VCYHG0H8UG2SpsLNBodFHdRBixI=
X-Google-Smtp-Source: AGHT+IGCVqrktFJMhN8KD803z1dPo0zhcB3zfSS36FFM1z1Y4PIom+eNY2L0x7T3Tklz7Kvg7ddvQ3AVjzH8oKAMDlc=
X-Received: by 2002:a17:907:3e92:b0:abf:427f:7216 with SMTP id
 a640c23a62f3a-ac1f0e6e95cmr214652566b.1.1741079505964; Tue, 04 Mar 2025
 01:11:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303074552.3335186-1-zhoubinbin@loongson.cn>
 <20250303074552.3335186-2-zhoubinbin@loongson.cn> <CACRpkdage9PLDURkh5A3Zqi_BN6POva5yNdSRbf5u8p5q0qnHQ@mail.gmail.com>
In-Reply-To: <CACRpkdage9PLDURkh5A3Zqi_BN6POva5yNdSRbf5u8p5q0qnHQ@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 4 Mar 2025 17:11:32 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6Z5yrRqnWD4XPAsuCuxEAux6-sMvMHSP=8TPBH5JvrQw@mail.gmail.com>
X-Gm-Features: AQ5f1JohiKW0WSzqg2VU1xVfalcgCjeEjTgRQ0k1TxRF_9mQXmKgDwAauGexH0E
Message-ID: <CAAhV-H6Z5yrRqnWD4XPAsuCuxEAux6-sMvMHSP=8TPBH5JvrQw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: loongson-64bit: Add more gpio chip support
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Binbin Zhou <zhoubb.aaron@gmail.com>, 
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Bartosz Golaszewski <brgl@bgdev.pl>, Xuerui Wang <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 4, 2025 at 4:36=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Mon, Mar 3, 2025 at 8:46=E2=80=AFAM Binbin Zhou <zhoubinbin@loongson.c=
n> wrote:
>
> > The Loongson-7A2000 and Loongson-3A6000 share the same gpio chip model.
> > Just add them through driver_data.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Huacai Chen <chenhuacai@loongson.cn>

>
> Yours,
> Linus Walleij

