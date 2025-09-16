Return-Path: <linux-gpio+bounces-26201-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4199FB592A7
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 11:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A601B18922A4
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 09:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF990299937;
	Tue, 16 Sep 2025 09:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bo7oKQF+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DD2298CA5
	for <linux-gpio@vger.kernel.org>; Tue, 16 Sep 2025 09:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758016084; cv=none; b=YtRkZCPXcmGUURZJrCWuL627gVmll7wJs2wUXx/ukImxWL7v/jo5RC36B02Je5LETzV957saq8sUfcvyJ5HC4RTnJ7oqMWjOy8vbWYY/QfCz3xtrjVBEYza5np+yP5r71VDB2PfWREqyecRGMAzRBi9EymOTe7pdO+25h2LZ8BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758016084; c=relaxed/simple;
	bh=Xtp6rsv0we6loXr8KX7p8CjvjrdRQN0t60CzR4y0U7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RLkHS2v+eXBnefP6Ht+ma5I9/KstG9LgV28ON3M/42nNRDOPlN61BsiNTHYxtTBFBJsHN+FrHeCqBAiTfDYEBbpO+wG8f9eOLqfPnJRRsS/KwvZlpMjdsXHCkWSE2ZdJFF9Nq21AAk2sR6+WhTCeoaTbQf2MMbSTKh7evAFxNV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bo7oKQF+; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3dae49b1293so2903772f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 16 Sep 2025 02:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758016081; x=1758620881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZHjpXhjv6Uw0u0A/3vKysGefkTkoDLwlYIdI1qGXpMY=;
        b=bo7oKQF+hMoLOeZ0xhUC8h3Vr1QmzZTSnGRzkAQqd+cqTnQABzLNDfnx6Z3JunihDW
         JaYTkDfqPFYQeTh6+0KfENHjVAIJfwmwl2KWyivGLK5ewoudRBjiAXl+ytQ8ziFSOscq
         zCMxCdwXGMbkORGA0vcmLVlqRbEfe2NpctoAp2lgrVkQ6RG2qF5j/iokKLwdjKmI5hLh
         1RbnWfanIDYyCK8+I7pwfp9w72O4lLDHGsiEnV3iCSrqsbPVqrEEhOmidZ5FHVPr3Whe
         kjmfhRQdA9hIM/e3VdgW6QYuGT69ll3b0w3/utrrZa789gOzcrGP/RGeTYx4HDVRMEiA
         lQ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758016081; x=1758620881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZHjpXhjv6Uw0u0A/3vKysGefkTkoDLwlYIdI1qGXpMY=;
        b=g/UdvJpldDETdbEHE/Rq0iG/5QXnScJ9QocjRPg3+0faVMiaS9UvTEQN2uH9jjlp/M
         h51l1AXqtFw6Qa+LwY653mUIOV68HrKC7Mm9zm9PRTtcx+rBDjcXAhR9pwzVqWIvW33k
         4JQZa4WREdVTy9Sv/jzb4Bw7Mbaev5dQgFC5SIGvr+u7BHFw50mlgYd7C+Py7197Kw92
         GVg08d7CgBj+Gt9iZo9fZOC60fyDuueNfsJr6p7p8CnM8T+yQl0Nae/0b/zELCPPIuwI
         oAKxWZ41hdblTzIS3dvzZB7+ARxt/zwsGwDFUL1EplQ6z5i214DXYOcbiEA0Jdq7Bi5g
         4NZA==
X-Forwarded-Encrypted: i=1; AJvYcCUC6dCr5Kc0FV/aVQtgbKh6Dhy5hXy0QUTaCAHk89Zgqh1Oyhvn5GHpIm8GB9VhsWbBtXNRGEd+F/Je@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr9uO0YmzPIrNqTEdh/CsIwrJM+B12mQFeMkeBjtwHxZItPT1J
	kW78tU8ORbzPrCwCm4rUjF3NH4qUzRulC2Ylbn/vLToc5llMyhHWjqgY5AkY+FCn+n0=
X-Gm-Gg: ASbGncv3/LFaESHqcZO6ISuKbtYe/19fCnRR5oTTGYp/eqVDgCoCtoF9YhSGl9WX6wx
	YcCWDmdW3fBoo57wAeoNa0Mz48eryLF/PSyMFfMcpFHXEU4kJ1745BXChiDxouIQKUjeWYrS4t1
	rUJz0ivpNiUhqNhzVo3gj/JWAr/l5nxcrH0O6vM9YiWgsLTv8J/+k4qkX8wo/ImJ1O34JoI+gAh
	fGQCyPFVLJsHkGVosqwa0BgJYcSBPQrudShtfrx5lxEazLBJYg8AP8NszL693qb/oawPmi+Y/fp
	NHrsY0zNytWGzDae4BZHps/Ux7eNz07T8g6SXFmGmrURRymvil6q9iDA7gOUp2GH89EjgA3wOED
	r/8the8A1cQqMLt4xa3O/AErXOnnACu9Fydej
X-Google-Smtp-Source: AGHT+IH6+DN+2iC4Z4uhDEfr0LB6Z+tnW4YIIzn8sB9BkEp6enUX0B4DN8xSWO2nsBfkghB42HO8UQ==
X-Received: by 2002:a05:6000:2586:b0:3e4:1e29:47db with SMTP id ffacd0b85a97d-3e765a25836mr15049192f8f.43.1758016080849;
        Tue, 16 Sep 2025 02:48:00 -0700 (PDT)
Received: from brgl-pocket.nice.aeroport.fr ([193.57.185.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e760786ceasm21733718f8f.16.2025.09.16.02.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 02:48:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] dt-bindings: gpio: fix trivial-gpio's schema id
Date: Tue, 16 Sep 2025 11:47:53 +0200
Message-ID: <175801606720.9656.18120314835859405070.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250912165916.3098215-1-ioana.ciornei@nxp.com>
References: <20250912165916.3098215-1-ioana.ciornei@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 12 Sep 2025 19:59:16 +0300, Ioana Ciornei wrote:
> In case the trivial-gpio schema is referenced through a $ref like
> /schemas/trivial-gpio.yaml to match its current schema ID, the following
> error message is displayed:
> 
> Error in referenced schema matching $id: http://devicetree.org/schemas/trivial-gpio.yaml
> Tried these paths (check schema $id if path is wrong):
> /path/to/linux/Documentation/devicetree/bindings/trivial-gpio.yaml
> /path/to/dtchema/schemas/trivial-gpio.yaml
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: gpio: fix trivial-gpio's schema id
      https://git.kernel.org/brgl/linux/c/17628f1abbf4bd4162c655f3260d68bc1934ec73

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

