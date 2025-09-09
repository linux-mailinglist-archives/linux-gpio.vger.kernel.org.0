Return-Path: <linux-gpio+bounces-25799-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 059E6B4A828
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 11:36:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28A95446662
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 09:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA7E28C011;
	Tue,  9 Sep 2025 09:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DL/ppwM0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFAB28C03B
	for <linux-gpio@vger.kernel.org>; Tue,  9 Sep 2025 09:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757409960; cv=none; b=BZGGTD1a8KBsKGCIKTUUyYdazEmeGj2cOsAdrnkOtdy7yD9q45QLwf5bNGDIsYAx8RtOaiBKAnwREUb9mpByEd8eXJkn/KsCTQnzpjMMK21PxAV2xpRB5DEN5IWyKZkgJ4r+bZyYT2NEzw8ccbJyZjKf5NvNkVjsD+nWfhPIgqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757409960; c=relaxed/simple;
	bh=mtwTZBCG02wqFULjVOXN0dvjU5R1WP0MDuPW2wXd37E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HeR454CdrAJnNBjJToPOfzOrawyv33sOwDGzIjEotE5//Zq0INI0XJMLymwhOgxsNKIbp+coUakniCOu4TRNl6k84OLcDt1rjMMAvYplv5qN3jx5q1nUgQ3niCWEm7CTsCulF32iNcz7vo77SHAIjMoyJ8tY4kT3KxnQmEDe/w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DL/ppwM0; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45dec601cd3so8535455e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 09 Sep 2025 02:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409957; x=1758014757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QTZkX6SgvU00seIHVPvl5juoI5wuj1niLl8FAorHShs=;
        b=DL/ppwM01blioW0/a+FQayD40wAYnRw34cFBEA9oSRPJRkmT4iUU1ftvrt5e3i0+Yl
         9F1WcWAziHgJpYR7K8S+Dfy3XYc42xMqaauILFuW9SMRAwD6wjMLXkVfQVE3CrZUa+L0
         7u8OX+i4SRzqFWFbi6XqQhpKpoWqkZycq7zCYicpYVja2MxVmW6e4hi5tJVxGST377SP
         BIM6/a0GSWDBvJlbSXTylU1ZdIvklAej2ZHURKKiMWmzgVKcc960WRrvWxo6WzbWG7VB
         80RMnRk0VBYuwm4JRzWvllCXSyxPwaeQf8VWZivyYRjNNck4qOidbA4LxzWgVbC7ETIt
         jPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409957; x=1758014757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QTZkX6SgvU00seIHVPvl5juoI5wuj1niLl8FAorHShs=;
        b=tq+SYKFNJmhAuCYqikcUWPhx8VCZ5fRRLlDnxKoObj22Eq5X4/2i88y3s6etL3ilW3
         /f/iUpYlzR7vQrXzUalkzmAarfiBmajCLEmiumpkngbsIpzwkqy/kPaEyJlEaALJCJu5
         uGK50Kx3oA1XZa9WtXrqTyxDt/bEG5uy69JzOVbncq5sk7b2u4c5NnjCSxLm8RE5Ex4p
         SHWDSOc06pwCc9S64M+yyIhb+ehvYCgI+t8+rqpHc3poouyQszzrzAFvObvXpUIgKOqb
         W52/Zsfl1E9yAGyNlrjiBf/9wV0TxbllW4kO7SZHyNuC0G1MH9yrbZoYcuR43JICDn22
         C0bQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxsfjRU1MPE9lCzWOfnBfpVhEf+K977hWCr5YP6VE+rQ17fEFLXDCQeuMUJOmE49+g5pjqyXdQcR7I@vger.kernel.org
X-Gm-Message-State: AOJu0Yzaomj/wADzN/QOeShVh5dqGJ0BYESTc167upXGnrW3kDfL58F6
	jcFIPrAceOQ28gp/L9Pbevxb9NW5oFd8TOcF/U0FlAjoA7Cw8KhUxEU6hdrxRh2G01Y=
X-Gm-Gg: ASbGncvkbLPTqYaicH08d0+j/tUPcCIy1EaiVZOwXB4RLs3hRuLnEM5kwn5DXGGtpQr
	+oCAQ5vcYOgfn5GUz/fOepr4+CiO0JNi0KVnw4XwKirknbsDnRRrlplKBdX9ay5KqK9HosV4pQc
	+mmBi+NEKvZRP11Bj84Bh0xIlonvf5rtib7+tdPStJO+Fl9/GkWIZPiGFx67YW2S4x3Qshziv8w
	UUTKTqAbkJZm99HVemXUAhVuWrq8A6tlio6E+4/TQMlAGat4VTbfVdFH3mLQs1PBgnCiT/yHQGq
	FgBDhs9U8dAeY12I1a+r8s6GVAZXJyge+5n8a8TrEb0cdICQ77zVM5lCLJ+PH7cjVt+x8JCYbsj
	rGZztf0LubK/D7gUxy7CUWkdQO+imiRkU/Nw=
X-Google-Smtp-Source: AGHT+IE3AwCG8lJlzLoOV2h/I6mjaH+ncaS6bjsiv4qnl8eHPDZ26tT8BsJG+sFqaF30rJp1FfKdcg==
X-Received: by 2002:a05:600c:3596:b0:45c:b5ff:8252 with SMTP id 5b1f17b1804b1-45dddef758fmr99477995e9.25.1757409956661;
        Tue, 09 Sep 2025 02:25:56 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e752238760sm1832440f8f.34.2025.09.09.02.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:25:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Vincent Fazio <vfazio@xes-inc.com>,
	Erik Wierich <erik@riscstar.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod 0/7] build: detach the libgpiod API version from the libgpiod package version
Date: Tue,  9 Sep 2025 11:25:53 +0200
Message-ID: <175740994884.68889.7973261511004011050.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250903-api-version-detach-v1-0-027ca5928518@linaro.org>
References: <20250903-api-version-detach-v1-0-027ca5928518@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 03 Sep 2025 15:01:58 +0200, Bartosz Golaszewski wrote:
> The versioning of libgpiod has become quite messy due to the rapid
> evolution of the project in its initial stages (which forced an ABI
> version change without bumping the API) and later extension with several
> bindings and tools kept in the same repository.
> 
> Currently the library API version and the package version are the same
> but we're at a stage where the core C API will most likely remain quite
> stable but we're still extending other features of the project, like
> the DBus API, tools and possibly other bindings. Bumping the C API
> version because we added new features to included programs makes no
> sense so this series proposes to detach the core C API version from the
> libgpiod package version (except for the major version updates but I
> don't expect there to be one anytime soon).
> 
> [...]

Applied, thanks!

[1/7] bindings: cxx: move misc.hpp inclusion to the correct place
      https://git.kernel.org/brgl/libgpiod/c/aeb74d629b2c060da6e04ba087448bfcb58c791e
[2/7] build: define a separate API version for the core C library
      https://git.kernel.org/brgl/libgpiod/c/cf49a9a57132399fac228285c7fc11d1d1c39bb3
[3/7] core: change the behavior of gpiod_api_version()
      https://git.kernel.org/brgl/libgpiod/c/a62c7329366d49933f5a69b5aa9f5e79bbec4676
[4/7] tests: update library API version string tests
      https://git.kernel.org/brgl/libgpiod/c/d30bcd7b2ecaa2da1a299c7f53fbc04325b2c55b
[5/7] tools: display C API *and* libgpiod package version for '-v'
      https://git.kernel.org/brgl/libgpiod/c/8d0cae535df5339fbb0faca9b86452c013869d40
[6/7] dbus: manager: display C API *and* libgpiod package version for '-v'
      https://git.kernel.org/brgl/libgpiod/c/5204b44f83a110a5404631bea95445e4c50a96df
[7/7] dbus: gpiocli: display the libgpiod package version for --version
      https://git.kernel.org/brgl/libgpiod/c/6c4812be6a822d5c6a09fb0f7d352a91e03cbcdc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

