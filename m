Return-Path: <linux-gpio+bounces-21837-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D24EADFE7F
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 09:15:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF8C31892EA5
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 07:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D15D8259CB3;
	Thu, 19 Jun 2025 07:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="f5BCfJoQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DF4248F6A
	for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 07:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750317322; cv=none; b=mlBfsAuN0sHnNu1U8OC+RrcUw3nDjQbBLPbrjQyJ5CW6551xpF5FLrOuAXSKSQPFi6Fs3Jq3QLoSnL+PD50GWYm5AwsvtClpONEoZ3VU+arNXDb1Nm87hnBiwePzW0VOl4rC6qj9WQUh0hkElRGpom24Uvyxn4SvuST0gvsr+A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750317322; c=relaxed/simple;
	bh=azsM6gK73QrTaoeRLkwV01gG94aCop9xxc9pn65tZ20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dcY9J0ENGI3ES0a0Evjk0LD4/57DZ5iAFAwujVs3hteE1QE5aGcLVnB2iuGjTvOZE9Jlkp143DIKt8UxSSEJdkBfxM24IwcAUs/+79DCZ1Cy7UUhQrjoRiDbFfDpIEkq4DgJ0pqdCfTgbUREQhBEC3ANig+b1irGgD+wbVgOXPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=f5BCfJoQ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so392743f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 00:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750317319; x=1750922119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKzUUF6/e+HfzK3546Xi+byshZVmod6GzlMs0shwqpw=;
        b=f5BCfJoQrXkeSyZ4Z9e1oqJ5Unh9JEOZIBsUfy2bfqXMz9DWnkT+JDk+DCbvEb1EC5
         6uD9Zu3WDDlR8lWhoUy3Sow55so2WveSQvWf/eLaGgv91MEkDAZwVTz1DIBMCSNEHALI
         VGZr/dlxlaY3ZHE2N7Pki270LMfwHmbetXG6I/XJPF0GaoXr+/Bj7MZQTQYjcC0gpPwR
         Wt3LO88VPZQdN2VwN05WjfN7I+TLkcU50Io03KyPXovUVEt2fXVDiP7NzlL67K9DX89I
         IWXIzlg0c8g5ScgkOSjxGNM5nmXG/bAbWb8ZQbzcboZWzOQeFo4Bp3hpLXegBR51ZXG0
         HYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750317319; x=1750922119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKzUUF6/e+HfzK3546Xi+byshZVmod6GzlMs0shwqpw=;
        b=gcqt5gUyFWPyQ0wqVDeTGiqlrIimp0cGzTdUQoJ/GuFw71mH0OutR/iBi3cAU+ygMT
         mIlehghL5SP03P+7h57SQi8JOdDB1alllRUREjTe59dnXR0Jqmjvh/pbvRs1Il0UqeVM
         FmRfo6jQDNRQvUeYeyESEYsxiFOMgJPFWWwzjJ97YICZRNNgyCCxht+qgLf9n8I6phV2
         oSyGHk9pt2O8+H8FeAQ92E9dpnYDUqX77f8PXMmb3KIeK9b1AxrYCA6T/C4QwUAdhXwt
         nzwFTUHK8N1DiV59WZ5QkYZD2Qem05CNv7ZSbkDe76wAoRwOpos+IOF+Dxb5O9aczIXo
         ewYw==
X-Forwarded-Encrypted: i=1; AJvYcCXZ80UNHpFFzIjBbUqFcE1eFfb7Plg1N0Y8nmP/ADR4uA55hlKVbkHKuZUMINYEQPV8bR57lZaBn0Zh@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0bURW80T6B+u9DqdUsDKWzMdoLDiFE9NbIl+mqR/ntlOaYOWw
	/kwfbcnrHyAIcx/RgdY1WIH/y2E0dujrnxL+m9For7GG0utfksCfdFWtVArXTg+ipyQ=
X-Gm-Gg: ASbGncsKeUO9DAGJE/X/LdmydR+M5emzDSFjUVejhcafKoilritjPZc0Cth7nhGhbFX
	JVRqSXBe4EOzPO0z4n5inQIfErlnuBtxlk3l+JKrKHO/Fs8zvmxuPT1OTG9lZaKlx3FFO+5ogZf
	u2m86BYtYoIWIK10m9r7lQ6/OvyGO1D5uEcYyG0IwIOvl9IvsfJaqxed481jEAdeNi6rlffuMhx
	tDnd5fllUIGokTOjAJFCp8NdXjQtZ/xCLo2SOzDxXRhBJ0ELdUDofRuNea9tKnpUkO9tl5MCihJ
	bkVCEG2mgulfhiFrjVBo9RZFpFYR8T9nQMKhl/dBQEhIU+0Ku67txs3YDsoUSdA=
X-Google-Smtp-Source: AGHT+IHzM9CDNvIYiN5160aK6wIt3C3U1tikuzm2U1UNcFFFcuB0cpRgCgEW4zxacwUIq5YyRNgINg==
X-Received: by 2002:a05:6000:2f84:b0:3a5:1241:c1a3 with SMTP id ffacd0b85a97d-3a572e99653mr15408173f8f.50.1750317319295;
        Thu, 19 Jun 2025 00:15:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a578510edcsm14685319f8f.8.2025.06.19.00.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 00:15:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH RESEND] platform: cznic: use new GPIO line value setter callbacks
Date: Thu, 19 Jun 2025 09:15:17 +0200
Message-ID: <175031731500.9019.10505927253620736687.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250610-gpiochip-set-rv-platform-cznic-v1-1-30afd2444756@linaro.org>
References: <20250610-gpiochip-set-rv-platform-cznic-v1-1-30afd2444756@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 10 Jun 2025 11:43:58 +0200, Bartosz Golaszewski wrote:
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> 

Applied, thanks!

[1/1] platform: cznic: use new GPIO line value setter callbacks
      https://git.kernel.org/brgl/linux/c/9da895e97057ad946b2e727694af3fa5ee51d527

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

