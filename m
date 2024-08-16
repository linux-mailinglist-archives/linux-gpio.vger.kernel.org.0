Return-Path: <linux-gpio+bounces-8763-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D39954388
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Aug 2024 09:56:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D5A04B26F5D
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Aug 2024 07:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13E097BAF4;
	Fri, 16 Aug 2024 07:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jxHgGbEh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9233C76056
	for <linux-gpio@vger.kernel.org>; Fri, 16 Aug 2024 07:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723794998; cv=none; b=U8Nj9lIG5v2gm3yBtk8qv5Xpcqt8nd9Y2vhBhqndVyuLuEjsLdSVFZ6mIowga7Gv9F4rKnG/sn6K2fVwslGrD/k42tW6PAVi0ZHMA1YjAUwpFhq1RjNG463UL+fq03ErzqjYzB7bMSh7S8vA5vCpSIWB8S1rxXhwIDX8gORr1Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723794998; c=relaxed/simple;
	bh=hA2Hj7Tj8lqvNZsMS5SSgwAfoCfsxhaTKRYncJAWwIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tblCaOQ1BQLXOPRpafguHS4JNNX3HhgKKX3sXRQi0aFFlSbCAfxJecJ9+2GP/wKKFPujpCB07pJQTATVrF4N5DzimLsG1Upy2jToE2WPVkubAo1RyUDKo5zgPY0lBS3A/CIRZwYSlAjNs6S5yksBIxfQRtJPct1y9de+qUDVwHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jxHgGbEh; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4280b3a7efaso11763065e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 16 Aug 2024 00:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723794995; x=1724399795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1S4fEzYxXcH7XpEcFzIdzgsg5p+Xgw7O0TfJ+597Rbw=;
        b=jxHgGbEhz1Z/klialI5cgTDpJo4JTdCIIfUF7oYt5imw/sR6nMn4Ha8QmVdbqTbGwJ
         V4z12ohuU4wcr111ZWxmfDw+RIDXd6f7q6r9nlWF81Gjl3L0o0p/1kwGYNMWOkZT0Bc0
         12i2taJB0BTiyIWzcEm8qOdYNTom8s9otFIIYWUm6l0bssvIB++wAq0stkNgbEJ3lsSq
         jNBOSeXbvJXfbcnayar+FSiym92TVmtY9v/x5MzUcY+eEl0Nz/JIOzvm8Hn2OvOKt5YY
         5IAl1FylBe9u8XvwH5tnfG7rBC6t+EQ/eCWPqxo7mer3gz05JuTt7tbF7rVW0WRV4UaZ
         QARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723794995; x=1724399795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1S4fEzYxXcH7XpEcFzIdzgsg5p+Xgw7O0TfJ+597Rbw=;
        b=JgPjtnATwTs4mOCS78AMHczQk7/YsuaMcI471/uFU8RzmpthDCAJ1OwFmDZhVoFaRw
         rna+zXcgWTrxRR0ObdEJWP6fg4PpuqaLbkxINDe5/7v1mrAA1VDsgPEwQCLhvgFmAAcY
         mH1sgdeHJfDXeMhiUXi2VAFKmsyM4rhluG0Ln8TxmuhpEV/F+G1d6d+0NB+icH7L7Dvt
         UWZitzHIOJufmCoL5ApR2Ygxesc+I4ic2EX4JjqB2rq6+011v1+9jLUvXrugkggh3xRo
         CIi/xip6XHQaANURrB06XVtX37hu83tOegOgHDvNwzed2b0kklmZAJ3LN9svP7dAqwFs
         BWqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoq7l/m8/32dcbDFkov/lKw4Qzd8/oxhN1G9dyZlTcWCAyMEgu3eoBnvogm3sosz+gkzqPGjEZm/4xYkcD1iS4Q2C8mXpN2WN+xQ==
X-Gm-Message-State: AOJu0Yw/7k2+eCKx3c/NYkL0WrsMHGq3+QUOnwW2KyNEm5/ZNdDsmc+3
	HxK4jHqUuOJAnj6TsVKb2Yy+kODwvASeJTN+FuMWWm+lur6Qp2/mZDBOKoKpZ7k=
X-Google-Smtp-Source: AGHT+IG1v5mUV6YJ1eI2188ZbOSB3cNhjwpXfeK6cnC2fcQEA9MOmY/ddzZ4f+GXd1ryW+il/C6IiQ==
X-Received: by 2002:adf:f1c2:0:b0:368:6650:fd16 with SMTP id ffacd0b85a97d-371946a329emr1549982f8f.38.1723794994187;
        Fri, 16 Aug 2024 00:56:34 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:aff3:cc35:cd8f:c520])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429d877f822sm87026675e9.1.2024.08.16.00.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 00:56:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	Philip Withnall <philip@tecnocode.co.uk>
Subject: Re: [libgpiod][PATCH] tests: don't use g_value_set_static_string() for non-static strings
Date: Fri, 16 Aug 2024 09:56:32 +0200
Message-ID: <172379499079.8624.13978411701159443804.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240813093025.94980-1-brgl@bgdev.pl>
References: <20240813093025.94980-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 13 Aug 2024 11:30:25 +0200, Bartosz Golaszewski wrote:
> As pointed out by Philip Withnall, g_value_set_static_string() must only
> be used with actual static strings and not with ones whose life-time is
> tied to that of their owner. Use g_value_set_string() to get the gpiosim
> properties and rework the existing getter functions returning const
> gchar * to return the address provided by libgpiosim directly instead of
> passing through the GObject property path.
> 
> [...]

Applied, thanks!

[1/1] tests: don't use g_value_set_static_string() for non-static strings
      commit: 47e14b2cefb5a6d4ae6d7bffd76fa7bd129cd23b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

