Return-Path: <linux-gpio+bounces-17130-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B9BA50887
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 19:08:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61996166B1A
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 18:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D293E2512D6;
	Wed,  5 Mar 2025 18:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GGkR8iA8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0839D199920;
	Wed,  5 Mar 2025 18:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741198087; cv=none; b=aD1/b3rwVXg6FWu1AFpVq2nvaSsxdqyjS1mpk1VyLW0EKkleuZ1nCzRwof2fPC1AZ0hp/zU6MuWuV5p/87weinU26E3blKwbym+8SUz49poH8G9yIl/UBrkBcfCIJUrLHb8UNIYbYDruh4L5rH1htPHnupP0xLTbtq+Hc2lNxi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741198087; c=relaxed/simple;
	bh=G97yehnfCUaEkX4rJ+36HP/dRpAjXYP1giHtMFjur7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qSmRickj5ZkJDvnr0pHLZSPjYFhBw/yJDrtQAvKbuAc+hCbYZJD/QlPkvJ9TQP9ECAYjULcCWQq6vO/UawqwdLZEdzcRAhdPBiIaXHKx+DR0HHaPNg3MqHakRAwb03pkDkQ09kWjtUTfwHtdLDo+9o19v+zd5S2bs6cwrgiuTNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GGkR8iA8; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso3797595f8f.3;
        Wed, 05 Mar 2025 10:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741198084; x=1741802884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G97yehnfCUaEkX4rJ+36HP/dRpAjXYP1giHtMFjur7M=;
        b=GGkR8iA8duWxxM82ga8TnJQ+f9XyhBSCGpTeBIPApTYXxdPwgmbXyyMaR5t5MDLZ8B
         dEsDCzMD0YxZD6mGjV5XYNt+ojv0lXXTlYasB/8xuoAJk2YzBhUF4aZwj9izcTLtjymD
         Sw8zL7Sih6dyTtT7YU+RFvz37m3XUHuslA65/qEdYfnXP9FDM6yY2G2Sg8MNJQ9udG5L
         HND7yId4LbDvAGL9ihb44Sr69YQ8WimR/rSsoR7kBbF7So15pyMvP71rdN/LWMPp0vYs
         bFz3SH1Ye4hKDR+hcBkQ43nCb9CrORElKHXaj+U3VnqCN8qxL2yAhWLonegZMac3BwjI
         Q8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741198084; x=1741802884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G97yehnfCUaEkX4rJ+36HP/dRpAjXYP1giHtMFjur7M=;
        b=N25DKxfQhcpRYBRmYa5DqAUksQQwD8tWlC21gKrfNlqHJtEoa/l5YcGoHsdSDbKvwr
         /nc8tCqyRORI67OvoS7eUzO9ZHruUgd03Xky1W3CdSKP4slWK6dHui5M6uPhRS2k4+2s
         Nx/WlG/UNWjAOxPezPbvwivj/+9aOv4UZ6PDiY2GS62nI+2gFX8ve1vbiNYsaoD1hfB6
         OeLhwgWzxuZP0ah8adfgi/jqxyMAJyFVETSOgWcLkomazSrHrw0Oh9t/U1y6RLPUCi8f
         3jLzl3C/BP3Raw7zMEmH40CFpvMnZiahBvyNbWOm9SjfINhtiOOoVr4R9qvuszvgSlva
         2f7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWlvFWyy7fGIx5MmrjA8ywYp0zYD/tz0Wf//qmwo9Urq6CgjcYf9cYewhmS3WnW/PtZ4XfALwb3cGxwMiJA@vger.kernel.org, AJvYcCX/lyoIS3P7hnebDxFJjyd1yTyO3RQlU1q/5Ae9wh7F5+c5hgV4//DxAMZAlOw1EZozAOvsjsG4RB50@vger.kernel.org
X-Gm-Message-State: AOJu0YwyVyZU3SqNVNadP4JCE4ikOKhL/ioFYjN3UwQV47Tf9Roa1nOa
	nSZ8aYFfZhodwOTvaIPvA3lvAaonmyA4eeppjs6tvB7ZbD5iLPLZ
X-Gm-Gg: ASbGnct48ZYANLo/HeUkx8njke0t62MnNfVz9PIg0nIHZ3oeEW82svdvdb6ap+i+z/J
	MPpslWQpt4hP7RG0KQSq1FBhoDWatWPyt7N4svaPZb/CCHnJvo0yEQBQm3GlQYoTp5vRieEKgGn
	JP8oscraIBbFSMurv690SLmexWhk1bp+kPvnlXiM83QVoDbsbPLeCjbzET5S5hhgqOm+OUg/4nE
	s6h3rENpuUxt4adqDz2Y15a5viCJmBwVwnmxjSFa74ouC1delfc4EqfGbzEzAHoW2X3fNlniJ6t
	3dNehwNM/o1lVEll7pLgV9mvEYtjWqPmt/+76MGuV8mb6kF3I3kGuf0RoUcwniLBtiVhadbtm4x
	Dehiw7gAXyxl9mJJ7MAcP
X-Google-Smtp-Source: AGHT+IFm8od6qyXXyVja7heRv60Cgy26NzGQfpPsD4T/2EJzs0OY9LJVVvkUZl+F0di/z2dnO6/Ysw==
X-Received: by 2002:a5d:5982:0:b0:38d:e401:fd61 with SMTP id ffacd0b85a97d-3911f7cb463mr3396313f8f.49.1741198084189;
        Wed, 05 Mar 2025 10:08:04 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-391254508b3sm1765425f8f.79.2025.03.05.10.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 10:08:03 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v3 8/8] pinctrl: sunxi: Add support for the secondary A523 GPIO
 ports
Date: Wed, 05 Mar 2025 19:08:02 +0100
Message-ID: <3535684.QJadu78ljV@jernej-laptop>
In-Reply-To: <20250227231447.20161-9-andre.przywara@arm.com>
References:
 <20250227231447.20161-1-andre.przywara@arm.com>
 <20250227231447.20161-9-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 28. februar 2025 ob 00:14:47 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> As most other Allwinner SoCs before, the A523 chip contains a second
> GPIO controller, managing banks PL and PM.
> Use the newly introduced DT based pinctrl driver to describe just the
> generic pinctrl properties, so advertise the number of pins per bank
> and the interrupt capabilities. The actual function/mux assignment is
> taken from the devicetree.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



