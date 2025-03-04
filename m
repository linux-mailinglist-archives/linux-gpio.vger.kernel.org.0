Return-Path: <linux-gpio+bounces-17000-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EAAA4D69D
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 09:36:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB5C63A8D66
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 08:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FA921FC103;
	Tue,  4 Mar 2025 08:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tLYZtpGY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689AA1FBEAC
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 08:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741077401; cv=none; b=Jwjalb7R0sVak7Tja04KY8sRYhpp+rTVIqZoLXR3xsBxKRvNnQoV6eCOBGpiHL3ZWnlkTNJPkKIK9X3mWkVEDGUn+2xJPJpb2y4uaJ2FBkVMTV69r5CsKweqLg+R6MJNoYmxeJOy5Gy0vcaOoVacV+vN5vaGbdtBsScyFFhlIkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741077401; c=relaxed/simple;
	bh=PYi+aVmBO+zhGv+v/pvUe+DSBs6vIh9tAtsRQ3oiTZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uZ3G/dAvwWIk+W7S+aC8H/iF21n4G2t/YdPHFPStVRC4xhLXk7R9hWLhBl3baTLSAerux9KaHDOx/1l7y1OQDQQmOpIa6guqO86kHdtkKFzHXsREPXBQ21qp9NeTLQToy57keu7s7Dq8KiGILKQsJ5fXSB7vNKqX6reJ0zWanMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tLYZtpGY; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6fd6f7f8df9so18424757b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 04 Mar 2025 00:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741077398; x=1741682198; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYi+aVmBO+zhGv+v/pvUe+DSBs6vIh9tAtsRQ3oiTZ8=;
        b=tLYZtpGYXiB+1wQeRtn31gXlBOubn6w45L+AC0Up169flYr+OMuhDHA14xIZSU2nsA
         kAkPfX9BacHdt5T+LTjrCbI+j1BdSNWoZ4SCEA7xU7IeOly++QjCYpAWXQdaT4bpVAQi
         N1CiQtT4r7C5TDSN4hXmYfKu1DffkW+HoyChElMK00PSfLYE6dAA9H080T2q4W5bLs65
         GwZq1F2Ipq0XfxB9aER6r+/lWNJWfjNiX7THFV53llU7lFVSHXccezX8lxjKBVex6Vc8
         uyzCkXZhGXWFG7ZhLRQlXDlitbMoVdTXmHJG6N46guLnXWQeL/Y5sidlamNJhnLDpzh9
         YAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741077398; x=1741682198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYi+aVmBO+zhGv+v/pvUe+DSBs6vIh9tAtsRQ3oiTZ8=;
        b=CaCWHuVwlJo6iYY221noxO3xOUycHUhr87/o8p3ob35cJx/Uk/Y1YIJrfzhIKIt72a
         LchPY2Efx/zEMtW/nythJ3BYhvbWhaOZ8O//1MO6YfIRsYQHrkIHVf2hysMc2MeVlYlT
         8yYWfYWhpzt8WpRLZ5IeWW82GZbGs/W5Bjte7EM7JiAR88qid551lK3fO5DcR3VjOTvd
         1V+9fnRjAwcIRiyM2cT3t4TTUpiqeq2RFLgUvIvv5OPngvopN+3g2vmiKGZe6PdEJPhe
         yvR79F54YPzLnCVeqdr8BtGdbaDlG6pTidFOswftnOfqdE6l6Q3saT97f6tIhAt++hh2
         en+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVjfBioA+jaQfxnhMdrTgk4YojdnCwzh6puaJLiegzEQ2q/FUzK71OHskqClACj+o/d5XO/P6om6u/t@vger.kernel.org
X-Gm-Message-State: AOJu0YxsptKi/YcT55IfP2387/ex+8d9o9n/ubjuiRPJxCShOT7RSQIv
	OueutJhbVrAqcs7OgO5z4UU7B/M05s1Z38qmVOb0KDRscGbrTJ08ziSQrN1KHQanjOHrYZZ216N
	q9HO6y9zH8vyZhprSzERFNRl9Vr0amAjPCRB5IQ==
X-Gm-Gg: ASbGnctuJ/h1jzMqovrqzeh3CDMBRcUcWPr/6g/z5N+Mzmud2H91ZUJA+KhRZLBubxg
	VLxPRSMyIL2OtuEaJLt5ymatoJsq95Rv09Rdh1iVsPnI7BwC7IAB/DtWnlV+HAhPRTTXmhAJNvO
	3UCEX3k/HjelFFNcyctnnDNwuCKw==
X-Google-Smtp-Source: AGHT+IHR2MkY/z6C2jBmZBfQewGfI+Eb8/l9yNKzCoQfpdxku3Ye0SXQO8FUr9fZFn2sj43MtQPg4KYYYIWWDusRG60=
X-Received: by 2002:a05:690c:6185:b0:6fb:904c:d9c1 with SMTP id
 00721157ae682-6fd94179d28mr27614577b3.12.1741077398395; Tue, 04 Mar 2025
 00:36:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303074552.3335186-1-zhoubinbin@loongson.cn> <20250303074552.3335186-2-zhoubinbin@loongson.cn>
In-Reply-To: <20250303074552.3335186-2-zhoubinbin@loongson.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Mar 2025 09:36:25 +0100
X-Gm-Features: AQ5f1Jr_LhSmVKNX86GmREr8zrN54IehJSNXf5UoHh8lLJUYfrOwtfNtAAa89Y0
Message-ID: <CACRpkdage9PLDURkh5A3Zqi_BN6POva5yNdSRbf5u8p5q0qnHQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: loongson-64bit: Add more gpio chip support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 8:46=E2=80=AFAM Binbin Zhou <zhoubinbin@loongson.cn>=
 wrote:

> The Loongson-7A2000 and Loongson-3A6000 share the same gpio chip model.
> Just add them through driver_data.
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

