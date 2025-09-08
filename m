Return-Path: <linux-gpio+bounces-25743-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C93B48E67
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 14:59:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FB273A6820
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 12:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BDF13054FF;
	Mon,  8 Sep 2025 12:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="umF7hq/L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85C43054DB
	for <linux-gpio@vger.kernel.org>; Mon,  8 Sep 2025 12:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757336377; cv=none; b=kRix2OdPnQvnccNOlj22TSdo7ovkpZCIeqyATOl2SHF9O40XBO5gzbzcbTcI09eG1tfDiouyKcnChf071AeOrrOk+O+FAZX/yldTk6Qk7lbSa4TtAc93QeJDrIW7y4TG9+OMNk+g8/2Sw2KuPEmirS4V5WKF3lzewSpZ7qwbc4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757336377; c=relaxed/simple;
	bh=Qp0uMxUhJ+/q3m0QL5gUQQ8y5ol//8UvcXyXEawrlww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TU2ujyWExdvcodeKpQTAMGvXFd1SeyKNvdVR2N/vS2But+EHEtf+OklVlzLnp74XO30YKBELrRZfxJY8D+6TYc4gT75t6+mKbRImYFgl0eXXE5nvs1wbY8JkEZZJoR+Ozf+bL83mu80EFMRPRBohe0LCJrOGUvrU49p0lKAFV1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=umF7hq/L; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-336b908cbaaso36895941fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 08 Sep 2025 05:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757336373; x=1757941173; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5BpttAHpJbHjU5zlElKTAX1nmzmhusdG1v06go3DFc=;
        b=umF7hq/LbohhsGF9AWppo8a91WEn1SGmv7eYxs8PRkTpV+xwgYyZuMhEkTOQlyAp1S
         stoi7k66wlWz4569h1Pc+Nn/a0W931KKGd2f9D1ZWYXn7QKZaszJG1WWpytuvA/eMH4Q
         rgvyOR55cRlkyLfH2s9OJ/FHlMuTQzcnWP+GEh/o9MaUc0ww1McE5YJKGzTk2IqQKSEk
         JZScnqSBJ+5VM97Y7OzBB4C54RYcoDYV+BURReavW3EFJ+w2wKu3G/JzMzE4VK10Bqdg
         GTVDOlWCfCeX7yUdhxjKwhQ33vdU5JXaTmMP5LM6PzsAh+YTvXGoPunZwIL9TtunVqMq
         yiPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757336373; x=1757941173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5BpttAHpJbHjU5zlElKTAX1nmzmhusdG1v06go3DFc=;
        b=Jr29Yt4lmAWA6xYXDssLmYV2f2kVX3Sa5E87JA2nDURc9AcduNbe1ACBTNyTDr5b24
         ieLHawsOwBuiKfovrbEPesc1350rd/4el98KaToeAI5C6RfHnsi2SpRIrTDg2RQ1fiTR
         BmGO01upQf/SH1JLv6241fplH1ofcwKF33g+t0vEfikDMk3Rs4zOT1ap1iOVeUO3WphB
         tHu4UbcYVrMWY5HFpognHHGFiLf5DtR9nW8lgazdJUGo6OL2UhJJexuwLOKIM2OAJ20k
         ZeFwfEUt2Vs8REnrfAbOqXXgRr900WHFkQLg0ptnkYJA/4ktwYMbI0HV53Ns15MFEV7o
         oEdg==
X-Forwarded-Encrypted: i=1; AJvYcCVQQeitZW7iNsFXnMyu6wxMTMe/9VFbbMX/oHHzT7ppM8UogKjyeiQF2u/vME66AwwyIJa+x16o1vhj@vger.kernel.org
X-Gm-Message-State: AOJu0YyCGVifTEZ35v3KFVzJ80/jbqjT1RbRbs+oEwM5OtCkEx3tIv3r
	5a+csE6Vlvcw6fT3qIfpZTue3Vz4Hp03rIhTIFfi8rBJoFT32gQkNtelwL7uyl/Ks8dZHoZXoa/
	Y3uRSGer5wblSk8g0ITklkWOQwJMaQeY7wsr5eEmlEw==
X-Gm-Gg: ASbGncv2bKprdYbAkRe7Vqeu/tTRU0+17NXtnXNcZhHRlIvz2R0o04ZD7te8x115YKp
	ArX154SntG24xNWT5b74oNhVvCSWTkj4f3HrCNh+OAPZPZNYhs0cK7C3AWjt6z4KxGqV+klXSMR
	YuGeU3kGAMToQCNOxdTkfKA6uji5ppXM7W7pisPzwq+s1fJK7iGjUr3F3spj0siZPL37+TSZAB/
	/g9NEhdDytgGprp4gE2UZzvVD3D
X-Google-Smtp-Source: AGHT+IHxkO5Trw9x8IQx8FMGDMwnUY1eThHnZXuMivELDVJEriHgjq/E/h355l8gaJCNCLOfPlh87yQTWfxAaUQ+yRQ=
X-Received: by 2002:a05:651c:542:b0:337:f84a:6ded with SMTP id
 38308e7fff4ca-33b5fe33199mr21312101fa.40.1757336372950; Mon, 08 Sep 2025
 05:59:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <179c9e8c-8760-41e6-aad7-7a128df60984@omp.ru>
In-Reply-To: <179c9e8c-8760-41e6-aad7-7a128df60984@omp.ru>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 8 Sep 2025 14:59:21 +0200
X-Gm-Features: Ac12FXwB3hkNayk_jKlRJHBwnE7MZt7LhknFIIwvxH7yn6EzRdVpugXhQZOilew
Message-ID: <CACRpkdbzEmZN=-FPvax4z_iq7u6pHyHGJ213QtpxqFL98-Ou5Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rockchip: fix NULL ptr deref in rockchip_pinctrl_parse_groups()
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 9:49=E2=80=AFPM Sergey Shtylyov <s.shtylyov@omp.ru> =
wrote:

> In the Rockchip driver, rockchip_pinctrl_parse_groups() assumes that the
> "rockchip,pins" property will always be present in the DT node it parses
> and so doesn't check the result of of_get_property() for NULL. If the DT
> passed to the kernel happens to have such property missing, then we will
> get a kernel oops when the pointer is dereferenced in the *for* loop just
> a few lines after the call.  I think it's better to play safe by checking
> the list variable for NULL (and reporting error if so), like we check the
> size variable for validity further down...
>
> Found by Linux Verification Center (linuxtesting.org) with the Svace stat=
ic
> analysis tool.
>
> Fixes: d3e5116119bd ("pinctrl: add pinctrl driver for Rockchip SoCs")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

Patch applied!

Yours,
Linus Walleij

