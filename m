Return-Path: <linux-gpio+bounces-21137-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 461D3AD2F99
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 10:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09BC116EFA2
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 08:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA9E92820CC;
	Tue, 10 Jun 2025 08:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HP00iorz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED1028001D
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 08:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543129; cv=none; b=j9XVurS0sCiAqg2fE66sgl6NVHSNkK28u7Qgs0s8AOLoSwFm0IFguNaZ8wB5lzxJ8m2Jcp6iRGpe0JpFY/4jesUZ8Rmfjgw+AXMeop14yC4Y69uv+0jRH/zf+arlQYDFR3r2BJ/7Q4gl4TCXXd5wSKMf2R72wUKQeATj7CEjVOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543129; c=relaxed/simple;
	bh=LlCBFvgGHBbep8sr+0DAiL37oJOemIk9HgQQlbWJ7yU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bdexS1hJXqvgMUUiNko+hkeedrSELv5/qMD2HL+8vUjgFu45+4oQ1JGOShK7GDPZbVRhA0eR6UkTVnssdAvG4gmxZ03NxSBjVNfWJak4U/aG0GtSHP6kDb2j5uOdBUC6crRuz/81SDqrSh7PFQ2gZvBae/9PRr4YFDd3ezISoDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HP00iorz; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-450cf214200so47571405e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 01:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749543126; x=1750147926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gVpJs8S/HjaMxfZMJXEcmbSoaRFUt+5llRjDdfcTQ0c=;
        b=HP00iorzToU/HqO+E8upO545HFBDrKqsemL2rKKKi3IW2Yeq6ydAlbjI5zwBLY9L1h
         UIjPZMcgQ8DNgfXW1wn08okr9o5QVDJSr+nT9kdWLL/smwmu30hlOf8ZJilPOZpCg5Q9
         HBgfi457yUqdwlBxR8JmCjuvLXyvcGTHSSwL4vmfod2sZRGOW14VT9E7K7ROigbI/AKF
         AGEpF75qacc5I33ZLSdO6vMp7S8u0wQgcHzqiXFmUMb3h7dMoLTIFQYD+A8XTHcFRPWa
         PC9pb3zXb1ArGXuHoERGEJskM4P6NHoQTQEtXDgiBr+vOGRRMs+fSWPeJfm5DfheA61H
         lBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543126; x=1750147926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gVpJs8S/HjaMxfZMJXEcmbSoaRFUt+5llRjDdfcTQ0c=;
        b=bJAZm/a2HrkttL5ajJX4NJrmgvO5i1JKxlTG1a08q6Z9TK5Vx9eMRQ1ABc1TSePwpE
         z0ls/6bwTa7voCXp9Sv20QfHnF7zGJwO9++9LlJ6OnlDV9XDE9E2hNCYTLkHQfBgBjG2
         pfxeHIpTHlSIxF4dKSxbO3hPlb8x0wlItMzXi6Y5KCFbJUVGmJQ03IMo3zqacyYFyJjf
         KbeYNYlztHZHsI3/d+UhN+54TPF6BZhBcDIFcXEo+/fV6eh9mPrsQrf9GpXJoaoiR0c8
         gb8m9mmMhPujR4KGcby9oQ0hKz5sx267Nvkr9pwJOxyp1nIhLYiIrQ+pGH6Huub/vZ3r
         hXSA==
X-Forwarded-Encrypted: i=1; AJvYcCVXeW5WJdzpbeqJ/CSCi8+FbcB25ChmuvXyVCUeBHksCRFrUwqO1pzzxydM8NfF08RhHXh9g0NIKPfm@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc9CnKkAMELQ/W5dy2GvUcWVbju38N63HmzSX1EmfswGHghZTM
	02ZF6H8jMBCxIE3aWg+IjS+mA8cCbEc8+2+0311mah8OQu2l1K1iw1EJhLNQDr4Tsgg=
X-Gm-Gg: ASbGncuxgLqB3/rDMokV1E3XwjA+vkWmNZc/jv51jHxUzhil2L9F2Y8W0VPnAADKJuE
	kAwYfoeZwM1mt6n5lTDjleRMJofKBAmeUIcYQATp2oRs1y3XnbibVFt2CHajlYwNtmkYpelWs28
	t404+1g2oeW7IdjKEt/pXZWqsl/dF/BKuivhNqR/wWpuLN4YIoTqrCbZVfZ9vYcSE2an7fEminl
	TOItLClTKymc+YgnAQmh9GUvSRwT+ROvWVBKzL+f8mp1lMskJKAJEBgShrCxkM7yT9AWKMzD3JD
	5T91xBDFYZL0C/jtfdAXPBfTcZqFoW1EgZq7Sr9FBDWNovpc7hIwaeARtlx+
X-Google-Smtp-Source: AGHT+IGqKuY3Cpizdlhx4JXiy9x4C18UAtODglyX5DLPCu5C90go6V8r9W9aiiWBn1UaTTcmkgTekA==
X-Received: by 2002:a05:600c:3e0c:b0:441:b3eb:574e with SMTP id 5b1f17b1804b1-4531ce6e9camr20957955e9.5.1749543125773;
        Tue, 10 Jun 2025 01:12:05 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730b9b3esm130838565e9.25.2025.06.10.01.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:12:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: gpio: convert gpio-pisosr.txt to yaml format
Date: Tue, 10 Jun 2025 10:11:53 +0200
Message-ID: <174954311120.28634.7991564107488098129.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250522223742.516254-1-Frank.Li@nxp.com>
References: <20250522223742.516254-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 22 May 2025 18:37:41 -0400, Frank Li wrote:
> Covert gpio-pisosr.txt to yaml format.
> 
> Additional changes:
> - Add ref to spi-peripheral-props.yaml.
> - Set ngpios max value to 32.
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: gpio: convert gpio-pisosr.txt to yaml format
      https://git.kernel.org/brgl/linux/c/08894232efa4b53e7cd064450a6d444b92ab24ae

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

