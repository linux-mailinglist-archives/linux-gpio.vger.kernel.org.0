Return-Path: <linux-gpio+bounces-17908-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 520EBA6D78C
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 10:35:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B0753B168C
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 09:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB51725D902;
	Mon, 24 Mar 2025 09:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GWSg/mgt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33B01C6FF9
	for <linux-gpio@vger.kernel.org>; Mon, 24 Mar 2025 09:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742808932; cv=none; b=DARbERpHdCaf2tm8OUXoHa+cZJHKaZ3ygpy8IXShs5Z4LjBTWZVht2sSoAfl1s1ygXpXWUUQBaQPljuItHDoaE0cIuIlcgWOD8U2tS0ydNYe/JWWFQs/41L9Ne8en9ZbTm/ycpf/tHoREZJhsHQCf7vo/vbTTwpdr4gsv1i06fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742808932; c=relaxed/simple;
	bh=Pzo/0QjO/wS2p4Jzna7n2l/DCoFbfuVyz72x6e4Bd0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZNQ5C/zLHFntwq4ns7TORdT3/vItrWhuiBCHNJE1Pn4vWau4fXDo2fmcjY3UUGsf8wJ6xx8wLQbqqQQJxpo7y7Fa2RCyNFUdxYdURmFSAoeLyJ0mO35KoYO37JikPWG9YG3dQC7faR0yq1C+EPuEiSc/bGk9WjME4Qw93a2wklQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GWSg/mgt; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4394a823036so41806385e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 24 Mar 2025 02:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1742808929; x=1743413729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GeGPvHQatci2pQ5iwxhsk9xdokzqqYtZQCcW5zfA4/M=;
        b=GWSg/mgt+XApE3S1o5uwp3zcLfuXvAhKb+9RKka5kSnag65+HG4h/SOfLl7JK7onZ2
         /4aweagSeFnz/5EwxDaQ5qfcNML5ofIEEW9aPLu28s/WtQlwO4COczzl5Z04rnGb2l5g
         A9EwapKSYys1u/LtyHOtnXn89cAJ7z8R16cqMHtY0NhdqHBJ9cObZforWo8KX8PgvFfa
         /nSp+eQ6cmlrobfIC2ZHg8OTHC4Ts7Te2lheF4sLo/a/EE8RIZwLL0oZq8BFR1MuHPOY
         v77xiLCYdqsI9Wprs/ln8yBGx60n9TOVwuRX5fXTmYnATfgtRUZ4d9O0hMzbaPrFoqAR
         n2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742808929; x=1743413729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GeGPvHQatci2pQ5iwxhsk9xdokzqqYtZQCcW5zfA4/M=;
        b=b5NWDaHjjX+igBBeC3c9ZNztb3uBN/w5TfVsQTGrtO5wvNaS7+Oi6AVrqeLdM1PrhY
         c7zLV5MAI6cEOVD2D6AAdz+78y3D+cIBwKLTC2J/ro5o/I0KbW1QUjGafGBOEta0sSDc
         QHtVoAJgsTd8l9lP5MH8Rv3uEoYOEAw+O4Sik3MCXa9beyTNO6eEgJqrfQJgp43SZepL
         K1W7v0Sr6Dy3duOjD2OAgOxjwUvnXx522dffTWgO0qhjNl9cFtqeuGXlU0BkFUpySYsi
         mnQ9WgWCmq19ocrwmYLKLdALVdo4As37aUbev7bglmH+ROcCkrbvY7Kv/4wuhP8QQfaj
         p3JA==
X-Forwarded-Encrypted: i=1; AJvYcCX0grNR+dAL3QBACIvTAIop8GqPIQEMi97FHIoZ5/xN3WlFZylfhBc55aKY9s69K4uqY1M0N+wmc5Xi@vger.kernel.org
X-Gm-Message-State: AOJu0YxiXGN0nJ4WwYRPOKPVK0LqtTOlTMuz8l0Jt1WQYxY6WHcjI1AY
	o8IIeR9/vJyEJY9VZDRIT+qNJAjDb4Ehmo09GL/PlaRKnVNT6OYj4VIFfkxyuoc=
X-Gm-Gg: ASbGncuTZ1zt7jTdYRMgbH3tz6xNZV9bDIFVC33HfW5006SU8XqKZu5qNhoiuPXcN2+
	5HthtG2LtWyrW9yqzXwhybYlGydq0zw8RLTLdeudtAKI3CIXz4bHtRQ0q1+hXrsE9eVR2hHJXTE
	aNWgarlwKqWIdOF9zh84JWX8DCAcqW503dtH3Mb8nNpl7mBDoVVbFb5aMct9kED3khf2K81OX6x
	K68JMpXYD5JkxuUT3oMUzfU5UZ+ofS1He2fK7kEH/fgptBaM8jmHWZHZ8xIcZjQG4MA0yfp0F+Z
	ggK2YLvEK8gAkOuUCYR+9kbnXaPZA3wytsCuPlcgrm8=
X-Google-Smtp-Source: AGHT+IGxMwObCLUmE3BITJQ/LvSi/zYtKZtiJcPrToTVMjRfK0eeveJ4XyM4DI6LoLNEC29cFOBmfg==
X-Received: by 2002:a05:600c:3491:b0:43c:f87c:24d3 with SMTP id 5b1f17b1804b1-43d50a1d86amr118472215e9.20.1742808928735;
        Mon, 24 Mar 2025 02:35:28 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:467d:3e99:af5:c4ec])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f332adsm166466715e9.3.2025.03.24.02.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 02:35:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] gpio: update the TODO list
Date: Mon, 24 Mar 2025 10:35:26 +0100
Message-ID: <174280891946.9494.1789917451855355393.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250321-gpio-todo-updates-v1-0-7b38f07110ee@linaro.org>
References: <20250321-gpio-todo-updates-v1-0-7b38f07110ee@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 21 Mar 2025 16:49:32 +0100, Bartosz Golaszewski wrote:
> Here are a couple proposed updates to the TODO file for your
> consideration.
> 
> 

Applied, thanks!

[1/6] gpio: TODO: remove the item about the new debugfs interface
      commit: 0c6dcc49487608e460b89ff7a6a50c084b01f3d8
[2/6] gpio: TODO: remove task duplication
      commit: 01cbfc45b48beafdab84524df14b0b4a863ea495
[3/6] gpio: TODO: remove the pinctrl integration task
      commit: c36420dc4f9e11d4e494a6182586008d7969c841
[4/6] gpio: TODO: add delimiters between tasks for better readability
      commit: 5ceb3536f2f9ec4fcbe5f83cde6766c6cb673dce
[5/6] gpio: TODO: add an item to track the conversion to the new value setters
      commit: 9ff2443b37d8db5b4712afb1cf44a1e75803407a
[6/6] gpio: TODO: add an item to track reworking the sysfs interface
      commit: af54a2fbdf45b1fd32cdcab916f422e6d097f430

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

