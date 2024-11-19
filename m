Return-Path: <linux-gpio+bounces-13108-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB2A9D2866
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 15:43:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2643B23A6B
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 14:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DDBA1CDFDA;
	Tue, 19 Nov 2024 14:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qajm3mYq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B171CBEAD
	for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2024 14:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732027296; cv=none; b=jZQRmqvx1EnoSJtspXtVtRm5kP/50SjgPGOzfnV+tq3A5lOTKZiFejkpd2YlXwipqr5aTFrXnCA+aTfS52YXMWAyRu7295Jop561u//56VI7KQeWa0+dr20s+Y8+V9QGHhu1aTBG7W8zlAAuk+ZZNLiG118lXBryLoGzN4aRyfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732027296; c=relaxed/simple;
	bh=/5vOAD8bXrmLuHSH6AUkzn54OnZYnQPDPZjq0snv5tA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p8VXXZlyaYKfp6mIE/j0TGCpbA4MwQRTNOMIeDKGEjvV40TI89hFhDVUex3EMGVqCTDXbsqV8+c+I7bq92Yl4E+Cw206mbPrT53sRC2ZHjFgxhCLb4BVpWl4MTRpYfRITTsv7EzAtwXOrOzVmhAocBTa1F1rY5YWbcCUCjPfwYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qajm3mYq; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4316a44d1bbso37075565e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2024 06:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1732027292; x=1732632092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wbscTTS8AhC8YbweTdT4va4OGiY/fz4HckMpxdKJ9Ck=;
        b=qajm3mYqkeyoS34EF3Q6UQKP6H+iOkCUKOSkr+vZc0vcw0TtEfQLeCaoAG3SnC5HYe
         CYEG3PPpmuPMerdh4RUICr2eDS8xvpA7FCnTxsqlLuIF8uQolnX9bCbfHwFD0NwSjglU
         9sZQxWwbbBfLe3eR+UB+/K5LGJLXFqqG698Hucksv7uQ7BoeVkIfrUYGHM3Kic26/boe
         xwos9QzXmrvk+oWRBLMKEZvK969WbkH52UVFtTqk8/kXHroL+LNpqvcoJCF/h0SqlEmV
         CmEEGJqJ16W63WwGxhSv8Kakj4YZiTqEWCsAs2eqgyjk+M5/AEKSQ8Qhvz+fqB/1tSfx
         UYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732027292; x=1732632092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wbscTTS8AhC8YbweTdT4va4OGiY/fz4HckMpxdKJ9Ck=;
        b=HTzgaA1xanFeP+0zf3Gj7Iu8MNn1wmZUNGRFoACP6rJ0y0k6jkPeblOvrC+T5TQghm
         vUB+kWU0tHZwuKGOct2PKLkqGNGIU8N9dyev4aHZ04M1O1GaZ4OuhL2p0acTzVFdWbhG
         lxw7/DPqT2RTKGllvH7BwEc94BLHrZ0YHYKJy5yqauvjs4MFYNdEDuvtifva26NvlUJH
         hN8Xa7lW8KhacLQMDxpFaorf/fiuPZtQOK5eXBJNOq9dRl/XskbvQz1Tw+kSXBqcswct
         LCHWhJsYQgVpM5aDzO4AiqUWZflJSpMUDo6H9wEcRdh+E9ledXJM/T2u6rToe0+DWN4f
         rFWw==
X-Gm-Message-State: AOJu0YyBcfbL05TUzrsvZaP7Kp0I4abNzUOJdJu+zFbcX9P0LAh1dj8r
	aZDmh53DCeWRa6r0PR6ROy5u03hNpyxJ7k/aIlHggFs6J+sjIRs1N7tYa32bVMUeJkf2dtGGqxZ
	r
X-Google-Smtp-Source: AGHT+IHdAVH+GyRnnH2zclY+A8wawk9Mwiz7twyoK4CuI+5smSTql9iKBmQt6H1fXw2mLZyAmSumrA==
X-Received: by 2002:a05:600c:3507:b0:431:5aea:964 with SMTP id 5b1f17b1804b1-432df74dd09mr142076155e9.19.1732027292013;
        Tue, 19 Nov 2024 06:41:32 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ced5:6c04:b538:be0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab78783sm194421055e9.12.2024.11.19.06.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 06:41:31 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	Vincent Fazio <vfazio@xes-inc.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	vfazio@gmail.com
Subject: Re: [libgpiod][PATCH v2 00/23] bindings: python: conform to mypy and ruff linter recommendations
Date: Tue, 19 Nov 2024 15:41:30 +0100
Message-ID: <173202728741.118621.15314684745762899478.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114145116.2123714-1-vfazio@xes-inc.com>
References: <20241114145116.2123714-1-vfazio@xes-inc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 14 Nov 2024 08:50:53 -0600, Vincent Fazio wrote:
> This patch series employs mypy [0] and ruff [1] to ensure the gpiod
> library has correctly typed public interfaces, is performing proper type
> checking internally, is consistently formatted in a standard code style
> that targets Python 3.9 syntax, and passes a subset of linting checks.
> 
> Patches 1 and 2 remove unused imports, sort and guard the remainder, and
> ensure the publicly usable classes are available from the gpiod module.
> 
> [...]

Applied, thanks!

[01/23] bindings: python: clean up imports and exports
        commit: 7fde8a47f5845b20ef4774416b28bf063848dc0e
[02/23] bindings: python: make internal a private submodule
        commit: b306ce694ab1acf75502ae1cedf8ab6d8d9e7647
[03/23] bindings: python: loosen type requirements in public API
        commit: 8f62e6c45355588621ca5916cfab6d1d8e787a77
[04/23] bindings: python: explicitly type gpiod.request_lines
        commit: f5c70ec993497d92e62e0660f12d2bd22deb4a7b
[05/23] bindings: python: add type stub for the _ext module
        commit: 30e23df2ef9ffcb8f488383bcfceb03e07c31db3
[06/23] bindings: python: add missing method type hints
        commit: 498ec6df34cd103a532e33fa1a7edf47339f88de
[07/23] bindings: python: add type hint for the sec variable in poll_fd
        commit: 2a2904082fd1bbbf5863dccd4184873c5826ae72
[08/23] bindings: python: add type hints for Chip's internal members
        commit: 1cc8bedab60e9c72c215076424dceba0ecba5ff4
[09/23] bindings: python: fix Chip union-attr type errors
        commit: 72e51c8a94f508c472c855331ba680bb1d0b95e2
[10/23] bindings: python: add type hints for LineRequest's internal members
        commit: 01efd10160bfcf09566992522aa70319241d3db7
[11/23] bindings: python: fix LineRequest union-attr type errors
        commit: fcb520f9fe5cc6e550646daee224c6e3d0c3bfb6
[12/23] bindings: python: convert lines to offsets in LineRequest
        commit: fcddb71b45e7bf7dde3eb0c6849acba7bc609462
[13/23] bindings: python: cast return value of LineRequest.get_values
        commit: f3444341f4964b47f8e72f4ef697fad535d9dcc6
[14/23] bindings: python: selectively use f-strings
        commit: 42308c2df11a6ec30661ba7d90a8afe368bb378b
[15/23] bindings: python: tests: fix duplicate test name
        commit: 0f40c01a09c2aec7319fedf82eb171a37663912b
[16/23] bindings: python: tests: clean up imports and exports
        commit: 171577eb41f916b77772346c6fe12defea626793
[17/23] bindings: python: tests: make EventType private to prevent export
        commit: 66c12b72ebf21170eff96f2f3f3a864b41237c65
[18/23] bindings: python: tests: add type stubs for external modules
        commit: 72f2eede085905d2f55d6a1aabddcebb21ca264c
[19/23] bindings: python: tests: add missing method type hints
        commit: d9313c18a06432ec10732b94885f915bdbc722bf
[20/23] bindings: python: tests: add type hints to internal members
        commit: f04f58ae1d548542134a31f48a1285b59a2915fc
[21/23] bindings: python: tests: ignore purposeful type errors
        commit: 632ea4df4b3ec9c3721623b150c5f6964447db54
[22/23] bindings: python: tests: selectively use f-strings
        commit: 3bb5368ba2a399b975ea552b2ea86cf5079739fa
[23/23] bindings: python: configure and document dev dependencies
        commit: 0505dc36435b6d87523f530192d6025fc94222f3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

