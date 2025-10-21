Return-Path: <linux-gpio+bounces-27372-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0688BF674E
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 14:30:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 630C43BC511
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 12:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B35C3128D3;
	Tue, 21 Oct 2025 12:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r0/StCo2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A7CF9EC
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 12:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761049626; cv=none; b=pGBMc7ogt4XDt/XGvV07B1dwy7n1mmEIYFFTWcKI6E10xwauKLvr4Hig++c12XetiBuWbYk8rk03cAJD89dxvtr4kk7UUdSq3fINdz86NtucT+xlvmZy7C7KKSLD0mHhFahTPT2qBB5+lYGHybl4lJbsRXm6JjpE84kFGbOKMsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761049626; c=relaxed/simple;
	bh=dRItKHoHeP/Luyk8nQVlzb7QSwUwBxc0c3xCNUrv3pc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KYcBHrfmjia7nCJT+IjdkEAsZ5ln6Qa3Y0/fRWurhmMTCGQz/QPZ+l/elNA34AGHGRVOHcABUwaviIIpjrEFOJltceGPcwxO/+NGO6WIrv9Mw1+YYVji0Z0W4wJPm9Nkw3Wv7qCyf+YdDwmej5AYwW4EO+MBh7fVzGDSiqVOGkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r0/StCo2; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-58affa66f2bso6499003e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 05:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761049622; x=1761654422; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRItKHoHeP/Luyk8nQVlzb7QSwUwBxc0c3xCNUrv3pc=;
        b=r0/StCo2w3u2g1qjxUqJxjSWxI5xD+2jLMCNUc+662zrhY8ojQlsvc87YLoPg9+0mv
         vGSPc6Mfaf9pIQb0SYY7vnQTqMA+PtHklGv4peBLNWPojybYtB7DZ1GHJK+zto4qW+nk
         zM4jMCvTfLI8NGdVlaabwuiqyfAc37YBC1ev10xwIMb/9uxOVcxpvHSDeUV2uijW9XBq
         AWf5vu/jh6UV8nY2PJzJrLzOSVT1AOtQy84LJMidS00cH8TWo5nBp+NAysYtvO+gl+4Z
         YzG2uhUwyY0caIF87dwG5doNpECRXFJc1Z8/WcL8LDPSeoa781zY/zdm6Mg83S7OL+eK
         6laQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761049622; x=1761654422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRItKHoHeP/Luyk8nQVlzb7QSwUwBxc0c3xCNUrv3pc=;
        b=k4an5zk3mKSYjohJkwUPArzLGzGn6qmI5V98bbY99D7d9diYQtulIOTb/rsZifYZeW
         V3oBgdTcIPDjOF7pRkInT5Lzo8nI15s4glxHpAwOPFOqExNz4AqBv8gxmT7aZn766C8/
         y+21qFE/toksg5Wz0xxAkHTsnn4QMV49lkHbkYiwMZnwlzXeeCkuaZCIcJbXFqQKF7oe
         WFUGbvXgjhOzshZFBnilBKFmdc4uiFrGx3j/XO1NLH3C3gb9obIU+1adLh5B9xLk/1PG
         PkL0OniD7vmaoc+5u0th+H32IsBknhHGBfq2Am1koAtZd6I4cai+ljkjmrpTkHULs6sL
         riTA==
X-Forwarded-Encrypted: i=1; AJvYcCW8nVhnbvAR0kqgt3gJk6JGp6L17VG4h0zFLD5gzY289WZ3odgdS6+a3ltmbOkx5UJGuj8TSxAH80hR@vger.kernel.org
X-Gm-Message-State: AOJu0YzvrERpWWIrXmbLj6aP8blOsVCYc711Yd5jg3JGg0UpJ6/OtNni
	3rPCK7lXWoLO/elHFfPHVzuHFbuVsViOcmV+iZWVu3t4DvAts050FG3o5Tq2qdj36tOcLpkgAzC
	pTzXblQe5tIlGSQvzORQyDmTtZNyhsPH+k0tbNgLu+w==
X-Gm-Gg: ASbGncvT7j8ZHa7jPCgJqf9VdfRcjL+EzNvtKV1cN6f3YUshlcG2KSamK9S66fsKnZy
	E8tnBH1Ze6XfskxYpU4rcwOml1cgDwCykDINq3ZALbJBrH0M30mAfbUFindzBHr3574QWFToq3S
	GPAju2YZy5neyrNaq3qcL+VFMHl6dr8+LVV28cJAti7G70CJp3O7bTAcYZop42LRxLPPykEag7V
	vLZRpRphfVznqyeH+tq01fpYNPXRiT/J0tkQTv+oiu8SxzOGhCcVPPUpT+vdE+7VEN1Bh9ThpYq
	Y/+mYA==
X-Google-Smtp-Source: AGHT+IGxlVJN2rvaLyj+Brv4icN7nCu4VjMGW+HovXJOGOXiS4L6UUAPV/sCXKFATKrxTJyz9wkyawu1OYIvSs1RR4k=
X-Received: by 2002:a05:6512:ba1:b0:591:c8d7:c03b with SMTP id
 2adb3069b0e04-591d850cf22mr5196408e87.8.1761049621481; Tue, 21 Oct 2025
 05:27:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
 <20251014140451.1009969-10-antonio.borneo@foss.st.com> <20251014-affection-voltage-8b1764273a06@spud>
 <b4eca95eaa0e6f27fc07479d5eab2131d20eb270.camel@foss.st.com>
 <20251015-headstand-impulse-95aa736e7633@spud> <0826a055f6b2e3e6b50a5961e60d1b57d1d596c6.camel@foss.st.com>
 <CACRpkdbeaiNGfOFfVfDNZ=u=4yhCykcdSdHUv-td_DVyr3aWaQ@mail.gmail.com> <9dfdf02b7e5a99c515aff3c6528e2d5f70517201.camel@foss.st.com>
In-Reply-To: <9dfdf02b7e5a99c515aff3c6528e2d5f70517201.camel@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 21 Oct 2025 14:26:50 +0200
X-Gm-Features: AS18NWCW8_rg5qtH2LgaZCS86vARi5jbxP9hbx6C1qjmUJ3MwBUVy8SVIqQU3O4
Message-ID: <CACRpkdYRUcQLc07o4epJs41BMkweHp+hKr4KQbBeFW1ZNS3RJw@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] dt-bindings: pinctrl: stm32: Support I/O
 synchronization parameters
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Christophe Roullier <christophe.roullier@foss.st.com>, 
	Fabien Dessenne <fabien.dessenne@foss.st.com>, Valentin Caron <valentin.caron@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 1:49=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> The issue is that parse_dt_cfg(), called by the above mentioned pinconf_g=
eneric_parse_dt_config(),
> only uses of_property_read_u32() to get the value of the property.
> Conor's proposal for replacing my
> st,io-sync =3D <0>;
> with
> st,io-sync =3D "pass-through";
> doesn't fit in!
>
> For my use case I'm going to extend parse_dt_cfg() with fwnode_property_m=
atch_property_string() to extract the index from an array of strings.
> Then such index would be used for pinconf_to_config_packed().
> Does this approach look reasonable?

Aha I see the issue.

Hard for me to tell how this will play out since you are the first to try t=
his,
but it seems like this could work.

Let's see how the code looks!

Yours,
Linus Walleij

