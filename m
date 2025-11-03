Return-Path: <linux-gpio+bounces-27967-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDFBC2CB25
	for <lists+linux-gpio@lfdr.de>; Mon, 03 Nov 2025 16:25:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFA1C189DF82
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Nov 2025 15:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C534F31D73F;
	Mon,  3 Nov 2025 15:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Gb/b64iU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048A431D36F
	for <linux-gpio@vger.kernel.org>; Mon,  3 Nov 2025 15:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762182684; cv=none; b=JvP7SST324lnEm6TYRjAB/mpwA5ojfYtlBiNp8CJ8l+ci4x5UuAMD7GW7mzAxb7mKb7sibkK8hps1zeZIkBqi/8avMfSw90JpxofBGr+Gr7vZ1t41C6CLAah1OAqgSIiNNsUB/7Ycdz785dX+DR9OPay2r/m8S2pQQK9EydPpKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762182684; c=relaxed/simple;
	bh=ppU8+0KMVjssDLeGA5ZQKn/3oy/3w+zGpv5OB2K4V3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DMfCDSe4DC52kAvvz5MeDlAz9fJHSNU156ZpcxOlYJSHpaMvww3klOLdAO4jTR6TSgLL8NRB7XMq9LFEi8aHF/sdQvxkSxGAleO400V2B2tc2It9ikzqo+F0juIrwzVkD9BIxkeDMcE7+WicEd0Clw4nzyBoxD0a17/O2BeXR+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Gb/b64iU; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-429c19b5de4so2530085f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Nov 2025 07:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762182680; x=1762787480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DazVAKjsIrcYtXlfdeVBEA2qvrz0reDmGQp37QD+7+U=;
        b=Gb/b64iU9sw7VSFoVkB5F16FNE5yKfRRDeeDIDeH9s1gYU+9Irvxuvjr9YaCjXvDdW
         mcrNHchJVA//oe4ZSOpcxKm7jx0NIdAV9DnrNzKBjugd+MZPMhk7Y0vmx2w7YxQAG4eN
         cQa+glDSTKBRmjyiszLz3BoA4vxgWJWHYqhCK5LiLXcQgCewvOKE7UepFuvK8QR0oaKS
         fySqzsyKl536O6d5zIRhFFhjVg6krMtNz123HvhP36BnmESiJLv5lzTo43+Ihh1Gw12a
         c+oX7NR/2nZ10ZChftAWvHM84IlmZ5YP+w41fhbFAG67n4kUrjvEbQ5WxdFEWZ8Qmips
         co0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762182680; x=1762787480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DazVAKjsIrcYtXlfdeVBEA2qvrz0reDmGQp37QD+7+U=;
        b=f48/txzrp0XCcG0KM007hLpvyEKqM2vziJYxXDw2/VRqnPL8F34gpbYf4oFXSZnS8g
         PGrW+SmshDmi0RK71o3npChmdU+q3OWweXLLDO8xfIXsh+K2sOjYqxX9i6OcEnYMqSnY
         aqWM74yyEXGzJqVGk3Kgcswa7ROr4Xw+MSu69HtWn89ASqLt+GUj1g8W/F/0u8OD/rnw
         dAEG9qKvP+BHhtvzB8QcnvibHqDkj00Py/I5RsP/zUX/F8XYUIxY4iA7Gjs4xcMFhoL+
         PGYJNDPMrQXpqgFfdUdvgybyLdQYsSMDhNjsvX7oUNB5zblHeEGV4ryksPukw0yzfLTI
         RP1g==
X-Forwarded-Encrypted: i=1; AJvYcCVQd5ldgasujsKqvGZOg2jKkoSP/fCQzbnEVAejUEtySb/dtEdkpHtz0Y0MnWHCGSKzsbM4sKrmIVR6@vger.kernel.org
X-Gm-Message-State: AOJu0YzP0Lne/Gkqnbv2g24EH5GoAcInsLQN7nGM38WbCuKpn6T/UrRR
	CoYjW5hNl0Yq8Zcr52FpTL47vPEOFKu2JwQdEFWKa3MqRaGFPf/Da7UYWQ/m6Q3b3Wg=
X-Gm-Gg: ASbGncvpLLgOptAaLU48Put6gvj5n00wETw0zcUPlJZtkV0PVVEuZgekiTbqMDUB3J0
	/vWb5sW+IDCy/ukDzgvYNjE8V8vBX5KNACPzSzzW636BZb9bfq1VFRy5ztYg8AglBNl1+FTSapV
	Hk6/foEv1hy+GA6bjwQXe03czozs0U5ii1mhkTIKtMeBnYqTjdULAmZnAXHRLfsF/fm5KcpnkAY
	tm1EapF1UYamyVOtcMDIvLu/QACL0eJp68AV3yL3XrfgQd8A70lcW6y4Tbn7upB/1WNyf5lIS47
	J06Sw25QuUBtEw1buh2NCq0e4eX9+BX73gNQcbkpt4AWT8JK1HHSbfRvnLhfwQq+OPXO4eU0/Ca
	W1jb9BzVTcwj5wICoEpj/5xoy6hsT4mCzU+3uIjP8QMWSt695YnY0gwup8nM2Ckv3CLVaxAs=
X-Google-Smtp-Source: AGHT+IEK9m5S4OyAt+8+jqF9utRaLNjHjz1A1Pnmz56EXWQk8b3s9Aud4E7X4OrR8HH/uvBllI7Qvg==
X-Received: by 2002:a05:6000:22c7:b0:429:d79f:c86b with SMTP id ffacd0b85a97d-429d79fcb0cmr2028605f8f.58.1762182680270;
        Mon, 03 Nov 2025 07:11:20 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:e6eb:2a19:143f:b127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c11182e3sm21317427f8f.11.2025.11.03.07.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 07:11:19 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpiolib: fix invalid pointer access in debugfs
Date: Mon,  3 Nov 2025 16:11:18 +0100
Message-ID: <176218266920.62377.10595261785996832493.b4-ty@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103141132.53471-1-brgl@bgdev.pl>
References: <20251103141132.53471-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 03 Nov 2025 15:11:32 +0100, Bartosz Golaszewski wrote:
> If the memory allocation in gpiolib_seq_start() fails, the s->private
> field remains uninitialized and is later dereferenced without checking
> in gpiolib_seq_stop(). Initialize s->private to NULL before calling
> kzalloc() and check it before dereferencing it.
> 
> 

Applied, thanks!

[1/1] gpiolib: fix invalid pointer access in debugfs
      https://git.kernel.org/brgl/linux/c/2f6115ad8864cf3f48598f26c74c7c8e5c391919

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

