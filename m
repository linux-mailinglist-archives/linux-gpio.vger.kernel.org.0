Return-Path: <linux-gpio+bounces-30347-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55957D0A705
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 14:34:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B42BB302F2E6
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 13:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 334A635C19A;
	Fri,  9 Jan 2026 13:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jhYzqEDY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F8335B139
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 13:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767965314; cv=none; b=CwlzlQjQKcIv9Fof4/bYE7MhOEJ+f63CZmKLh/AQxNCD6vGiEwTp9omYiU5KWy1ifx7z2l/uagwdyjRQjZ7dBEuydZ9/yrS+/TArjZbLBXvbfIKQR1Va5OWVEc39gDLFdQ9s2FfPyX7I9KadnnP5J4G7LKzWW5gAzrcxAhs6wYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767965314; c=relaxed/simple;
	bh=XCPKuTzmFT+XjAECCMFeFIIXfTK4iZ5AJMLWp+f6w4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Aal9FapauWTjyPDWhjlTYZuL9PfbjJkjdYqkBjuNklfeAO6KX0j5bRQGNPh93ADHw4AY0dmZGFPDe/ygKfheex8IiFYwq8Wp8AWhp7WA3dwBhURUnEFw+pDxW9MIFlWKok4tJWYZHV2DqLIt4hlKBP7g+9oCOqJ3v6qyK+dHcFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jhYzqEDY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC098C16AAE
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 13:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767965313;
	bh=XCPKuTzmFT+XjAECCMFeFIIXfTK4iZ5AJMLWp+f6w4M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jhYzqEDY00gWjprFJyeEwZA3f/1P7hrbT5RfJdQi8ePIOIwZNwmUVpIYA8MIwKBl/
	 g1156Fb3pI0BE/7Mm3UQcuDmN82/7Zyy3mpEd8CIZMms7A8nBWoy+XOWscyVVgBsk8
	 5yWBpCVcSlLoM4WFueY9Wg87QRGO2kUxQ0Z96aANYmZvqvuVNTOh5kOy+EKoYazo7a
	 5cHA+E7zvsZFuZqsnnLkHezjLstAxhB74BQmKG0KXQJhZXb8acvavx5D86Cat4ze13
	 wK1B9U3JeMLL0hagSZlYIYlhSz3j2ppq2n9cN61BU2rMZejy0Nv/4O+NabX1iuILSu
	 OWw61Ar+TQG8g==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-78fd0cd23faso43786027b3.2
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 05:28:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUwgHH1DQhUbx9xgPz3lkJo5ZA0Z3IZqulwfYtUpgcob1YlypVsCF3GMjLY3XbkhayqDj8xQeJQCYIF@vger.kernel.org
X-Gm-Message-State: AOJu0YykQENi6Xs5zVGzghmDQ2gcYiNCXrQ/O4S8kL2aq0ACwtiFOzCV
	Wt8IlYI6JZT+meczJLncYyKp+DZjXsZWD0CpLt/ZD8cMgAL7jILJ2qKd2+NrDRbth/zoCI7QkyR
	c4OufXbUvFwToiyOP9lGN5S8/I6kxmOs=
X-Google-Smtp-Source: AGHT+IGuHzPZpKBfVFzUwKfCmtMtelryj+AyVV3OWGw/GQqYNZ/cAUokVmYHIKQSLxWynktwZPBNkBrSrWQjsIeKiYo=
X-Received: by 2002:a05:690e:383:b0:646:518b:b180 with SMTP id
 956f58d0204a3-64716bd2f01mr5826709d50.51.1767965313064; Fri, 09 Jan 2026
 05:28:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108100721.43777-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260108100721.43777-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 9 Jan 2026 14:28:21 +0100
X-Gmail-Original-Message-ID: <CAD++jLnp3xxSYet_H2VbCCLpQ93oXXNd86+RBno=oC_NbhtRzg@mail.gmail.com>
X-Gm-Features: AZwV_QhS1zB_x9JPN09oQL3AyD_5WXyXemZZmXFqF0iSW9BNaPbSwpa5v_8TNpY
Message-ID: <CAD++jLnp3xxSYet_H2VbCCLpQ93oXXNd86+RBno=oC_NbhtRzg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: sm8350-lpass-lpi: Merge with SC7280 to fix
 I2S2 and SWR TX pins
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 11:07=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Qualcomm SC7280 and SM8350 SoCs have slightly different LPASS audio
> blocks (v9.4.5 and v9.2), however the LPASS LPI pin controllers are
> exactly the same.  The driver for SM8350 has two issues, which can be
> fixed by simply moving over to SC7280 driver which has them correct:
>
> 1. "i2s2_data_groups" listed twice GPIO12, but should have both GPIO12
>    and GPIO13,
>
> 2. "swr_tx_data_groups" contained GPIO5 for "swr_tx_data2" function, but
>    that function is also available on GPIO14, thus listing it twice is
>    not necessary.  OTOH, GPIO5 has also "swr_rx_data1", so selecting
>    swr_rx_data function should not block  the TX one.
>
> Fixes: be9f6d56381d ("pinctrl: qcom: sm8350-lpass-lpi: add SM8350 LPASS T=
LMM")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Patch applied for fixes!

Yours,
Linus Walleij

