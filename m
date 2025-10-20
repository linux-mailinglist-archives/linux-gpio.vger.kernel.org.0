Return-Path: <linux-gpio+bounces-27317-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B79C0BF39A6
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 23:00:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76A2B18925AA
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 21:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71DEA3148BB;
	Mon, 20 Oct 2025 20:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jTKItf39"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A792E7BB4
	for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 20:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760993774; cv=none; b=kS4YRpFhhKI9ehiFsr5Ecgt03GDo0bY9/8xiGCo9nMp8cVSnUbSSszFJi/SYCxh3XvgwaGo7ONGVUB3kbTf36I9/rgDp3Xk3Ury0bJZTFZwQd1KKUOoN8Q4NXiDh/VAlUVduSvEHEtd8Uwmnsn4675DtRKzMLH4IdByBPcExFNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760993774; c=relaxed/simple;
	bh=KPDi/ONzbyezo/404PgKiTkyQluk8DrLj7+zoZTBiI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XesBI8vtcj4ZXlI0/mG0/yPSAqudueEeNqN9j0DKRSvZ8LQv38xOv5KdvQhV7dnt/UUQC2YmljQF+OKxOSEa4CfOG1wIN757pR3OECKsdpFex56thEpn5SfcenOPyScHHJzURphxD+LOWS17wI0orY3kuYbmosGFteU9pTaTswM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jTKItf39; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3761e5287c9so54947761fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 13:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760993770; x=1761598570; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPDi/ONzbyezo/404PgKiTkyQluk8DrLj7+zoZTBiI4=;
        b=jTKItf39uxktGKGA48RasuDBZo3D50hi/ecIui2L8BEF3zVdiYmOszKTAZ/6eMK9DD
         U1aZuVl/Jg6HwECql6gYQ/ajKMf9pRTfAgwQBJoJDM8+tgDkTJtrqaEz1Qy9ldQfbeOx
         sTUI3sQFDakhojlpIcHywMr14Mpn9QTnoDVQNjtRbptS9rZAJRJdKRNSd/Fi+Tt+Yaue
         lJlXTe/Lxk8coTwutqbUCa0jYIIZJwjZaBXFI+r9j4PQFsXRboFRINUgPazuMpTqkAH5
         jUfc8mgVDibicqzsUEBqA4R+h1qujQSKT/PJznGfRvnwTM4Wgh6Jvjz/tN8dHhOkBVjb
         AXOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760993770; x=1761598570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KPDi/ONzbyezo/404PgKiTkyQluk8DrLj7+zoZTBiI4=;
        b=HNwNQqT81tcmnLMRAW6ikITv8Hl6VlAzibfKkTCzMknQT/DNgNKvcisFHa4fKCfJtw
         4P+2/XWHqz//Lg439ELd6okttFmKSa+t4Cfv4i8AfZ3XRYl6gDnfki7Mn73WIisVtvL2
         e4kjyaJv9miQjdvvq1MbctDGRwQuBgo/bfwE2kqr/0pdPlI/zotLz9mkKAqD6R7HuZtS
         F5Xk/nL+us+9AoebnQzGRG+leF997LY1BDrBjYuxYMAAKw7Kr9DTdo1AqLG/69SG3Bav
         KxwzIEbz+uq6aPe8TaG32fRM+hIDEDpK/BJM53HupGT/VaThBKArwa6oa+8moZgrbhHp
         ZGUg==
X-Forwarded-Encrypted: i=1; AJvYcCUMVYMoC+/l1/wqCuC4LMZ7Aj/pTg/uo9HKqShxVqNb424ZTF/Z+lngFd/LuSs9R1tRObErnpPgqpaH@vger.kernel.org
X-Gm-Message-State: AOJu0YzMv5Y3hbk8GzivNXJpqbyac/5wOINTxMYj3izkAPGIeq2VqLbF
	/4yeO4HY8kf1+1EizbBuWZkB6PT8cBAv90nKp9pKfJs/cdxRceXmjxCSrQEn9IU6m/D/25h3Q2q
	otnVhxH8XrO/zCKJPQ5iVKvMnqzVYB3OeSru7ijnFmAq96esKjvMVj6w=
X-Gm-Gg: ASbGncvmeYq3b/Df4ZCXH88mwsLpp+wp6zIm884US26q0l5DCGcCH0h266CEgrCj6HT
	46ID6T/seAJtQj8oSzCLJHJTM2J8z4xA/iTPkPw4hjTefqCh3oGnFwfqdfVigNNucBoPPu3H9HB
	lcXgxNMz1BeW/T2M4t8eM3A8tSzqr92yFOLyXk7DgR0L8X9VJDZ/Ok4KmxTxHHtFY7T9s69Vv9A
	rylkFmiDFhmuLNwa9IiMFyDAtH3mRTwBmR5IFN881ZwedIJM8bZCVBFqLzGVJMX+wMn8lA=
X-Google-Smtp-Source: AGHT+IGRBR+snc/mrP1nvrB/wKqtP60la1CSY+obenGlvqYErOCTks8k7mteVD4O1yzHKYMcoV2tSKBToVA+O8Sh4TE=
X-Received: by 2002:a05:651c:12c5:b0:36f:284:56db with SMTP id
 38308e7fff4ca-37797a0e741mr41754291fa.23.1760993769829; Mon, 20 Oct 2025
 13:56:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013191207.4135075-1-robh@kernel.org>
In-Reply-To: <20251013191207.4135075-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 20 Oct 2025 22:55:58 +0200
X-Gm-Features: AS18NWCmdoPe9mUqm07LgesYzmI47cpuULBkrErXJf6vFAkis6yJb50IYSgtdOw
Message-ID: <CACRpkdZDM8zMtuPQ6rQQ+TZhz4bAYOepeETVQ34_MfDYx0LMmA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Convert actions,s700-pinctrl to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 9:12=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:

> Convert the actions,s700-pinctrl binding to DT schema format. It's a
> straight-forward conversion.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

No comments for a week so patch applied.

Yours,
Linus Walleij

