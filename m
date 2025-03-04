Return-Path: <linux-gpio+bounces-17007-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 266FAA4D788
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 10:11:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BEA93A5295
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 09:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B5C11FAC29;
	Tue,  4 Mar 2025 09:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JNoir0bm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0EF1EE7AD;
	Tue,  4 Mar 2025 09:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741079467; cv=none; b=r4PfLlsstbykvmTkFxlBuZgIm+mwyexFHv97PrxNSHZJ4KlOcx8yzq/CnsfFT6IZuhRzPknaqdnmu7gOIff7hgQm1n5X67S0O/2Qc78NW7S8A1/glLsvoQMEhqOzarzgzaizITsC8vD+DUjuOIehyO9Ix/9Ke0tFo79W2ams/kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741079467; c=relaxed/simple;
	bh=UT3DZW0qrtnSLRpPQbxgZcg9zC1mvmI5AY4kfZKp4Uo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rhWAr05vDBM6boswCOxQH3f0Lm9ZDJdpd+Pgkq7paj59X0k8yrkDhrb6fJjgIsT0dTfYgHiTzwjFLPTxXmgfFDWQ+OqaePC9iJABLDa7NKB+sGmw2NzYZIfUX34x7mntGZqh1J5Ur53EV5LdckMpTc0SnjuLqCsAZ4gJBz3mJ+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JNoir0bm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC57C4CEEE;
	Tue,  4 Mar 2025 09:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741079467;
	bh=UT3DZW0qrtnSLRpPQbxgZcg9zC1mvmI5AY4kfZKp4Uo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JNoir0bmNZtBhlSLmXEv8LvfZmIQqWL/qcP+PvhLXUS0raVcUbdxiJeChBptO15Ck
	 bmsQ3pdTHo1chnFsmsVySDWKltENXd9yuvIBFoKSJzweVM6TJq5/PdYyASj96jDU9j
	 DHOsRVPd4uHkGZZPoYV3ne/L3ZGiLsqnnjmDAtbsIWZKoXYS3OXaIFiuYmqHmAhzUO
	 gpjV3hIuODgZTLsXuGdPoqV74S31UDHRdR6J218dxC6Dgb+LxI4cgO8XSM6Fy8Dcjq
	 qojePriCmUhyEU3slikc4s/Fe/qCldpU83TGIdcwrXCljUoXhe4MxvL2RxNRQp2q9K
	 DgoIhq7xSkfSg==
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43bbb440520so22294555e9.2;
        Tue, 04 Mar 2025 01:11:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVoTjGSw26dk5x9/aiGMOmH9UC7v+EQKo28/suYWMCD99nwlNsGEoyJMYdF4dGFA8LZUpda4/+q9X4sHg==@vger.kernel.org, AJvYcCVsxap4cUHZcwh95B8fAnVBjmtdDopEnAUz8eYBYhu+gjifIUMU+MKfoZTYVwxdyLk2guqh6q7Y9p1m@vger.kernel.org
X-Gm-Message-State: AOJu0YzpiPVVvodFkVJcw3MlU/ngtdaJNI9BOeqxmroR+7VXgk1tv8bv
	UKqbJswPewuzeBR4qK9Zy8MydidQ/llIOuTXzlcHeBfQJQEeyr7Ja4j3lFvQ45B9CCjlkvyl0sW
	ulFUSsFXRwV+OvIVzX9ussFTj4gI=
X-Google-Smtp-Source: AGHT+IGNa78YTaKI2c9B/e6pR2w/0xN8cSsgHJm24/chyQag/klHP70SVhmNCWWP1teRy3o/80vTbf6FJ3c18DJVMZQ=
X-Received: by 2002:a5d:6d09:0:b0:391:4f9:a048 with SMTP id
 ffacd0b85a97d-39104f9a5d5mr6173906f8f.4.1741079465855; Tue, 04 Mar 2025
 01:11:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303074552.3335186-1-zhoubinbin@loongson.cn> <CACRpkdbrOC1ONZKFetvWQACmSKYopabgpCkip1ub_14XdrP0hA@mail.gmail.com>
In-Reply-To: <CACRpkdbrOC1ONZKFetvWQACmSKYopabgpCkip1ub_14XdrP0hA@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 4 Mar 2025 17:10:54 +0800
X-Gmail-Original-Message-ID: <CAAhV-H75rQpxYvL927P7YY99dLDqqP+N-dvpGV+G3RY843mQkQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jqbzj3xEm4xMRO5mpw6_pB1VQyqjHOVIjHofr7WKzVpeuRpP0aGW03KCGM
Message-ID: <CAAhV-H75rQpxYvL927P7YY99dLDqqP+N-dvpGV+G3RY843mQkQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: loongson: Add new loongson gpio
 chip compatible
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
> > Add the devicetree compatibles for Loongson-7A2000 and Loongson-3A6000
> > gpio chip.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Huacai Chen <chenhuacai@loongson.cn>

>
> Yours,
> Linus Walleij

