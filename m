Return-Path: <linux-gpio+bounces-5574-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8FF8A76E7
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Apr 2024 23:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 319AE1C20CA2
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Apr 2024 21:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D60F26D1A1;
	Tue, 16 Apr 2024 21:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RXLR2w/S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62BA43AC5
	for <linux-gpio@vger.kernel.org>; Tue, 16 Apr 2024 21:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713303618; cv=none; b=QfvukuM/qNYgehpfrPtlI9NCMQatIOudlI70xLSvg9CU2y+x0TKT966yP302iH9PkKnnbrj55+iMvh50jMGpTmAsVj2d6Kn6ZMdLRyzAfy2TArEKk2+wvVbMKTBJlYLZWDfCPiQ7kHSBNMwAhStG5r5nUKyhYvFgYFE3WzhHXAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713303618; c=relaxed/simple;
	bh=ckYkrSq0tg5WP/q/Fj2EAynhRuAjuSCDjFETuQTXHS4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oiiAvFdOjRdr3z8lpM6o9z8k55rwM6frn7oEhb6bwF7/v1YUsBsJoJpareFwsCD7Ho5vXhY0PdXsKQ7YqNMlPnbVCSQ61SXpFGiPRs8CzRCQwuUSWyKFo4rFeFr3533E7JKP+WffNVl9PMI//XkNUmawVJyVcAzOWU2PSlAwun4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=RXLR2w/S; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6ed2dc03df6so4352432b3a.1
        for <linux-gpio@vger.kernel.org>; Tue, 16 Apr 2024 14:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713303611; x=1713908411; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ckYkrSq0tg5WP/q/Fj2EAynhRuAjuSCDjFETuQTXHS4=;
        b=RXLR2w/Sed0Flq0W9vJKvzJa1QN3qNfXsPdCYLKG9K+QXjwZyWq0TofP2TkzQfEjAF
         bK9XD98Hi2nGNpEbMrupSsxtqWrmb5g9tlvBy+GKbi/S/SiRgqzjD9I+W7SgNCfx0m6k
         quME5snBSMWyGSYRjl3z6ISkBTZMXDsHk6Lk9xWqcT4toAUXFN1ubQu4GVv+GdYy+6kx
         FawOgNfp2+9b9UUszBrdtjIy11vGVAmUfjr59uY2ge8QLuAB+mvn1wRiIDLwOS78Ha6T
         9ig04EJBKm061OTwshJEA0l8FaH5YWV2QKH67+vdVVjfwme63pdKs8iFwqzVRKj3SSDi
         h++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713303611; x=1713908411;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ckYkrSq0tg5WP/q/Fj2EAynhRuAjuSCDjFETuQTXHS4=;
        b=VjH8XLXzwgdYUBJJLyPUGx80VBPRzFAaJcS1l+JAWed3fQtPMQNLkrka3xUBnLISfV
         vKsDpCls3oa1LGwhHefCjGsTmssAs9Nh14cVm+Gg84ST9zW0xTg8uQDsYLQgyVajbrMZ
         u6156GSa4yG2qcM4AbKeBmsWf1jf3tVvvSuqvnD6YeIWTFct0KBhJ4J/8DfHLP+GtDVd
         Jdn4BVxU/0lTjQD1iGQalkbSHFxv1T4qctLjdmRxrmL1WSh28y/XHYApiWJREeMn4GLj
         EF9leFMY+mx3Ok71+ZUvOnQxmKmmPpRY1O/gPN9yYWhEb6/VFW2QJSbYGeWhazoZNwAI
         0c0w==
X-Gm-Message-State: AOJu0Yzm+y/3CR+CkfexAojdq1C/Yi+CUHUT+mz8RkGyD9nKxJRtO2x4
	QfrLf8PGNJCMOnzRzVojgspU5TFW8nFmxPKbyM7i5E7d7LHMVHSirV2G81Vnog4=
X-Google-Smtp-Source: AGHT+IFSi9TwZz5Fp7eUAo6JM5aiu6cNYZx3nU7gcZ8IuXHb9vTujQbQvXMv5gePoViCXqt+ZPbBsA==
X-Received: by 2002:a05:6a21:2b13:b0:1a9:11e4:72b6 with SMTP id ss19-20020a056a212b1300b001a911e472b6mr16647115pzb.57.1713303611066;
        Tue, 16 Apr 2024 14:40:11 -0700 (PDT)
Received: from localhost (75-172-111-169.tukw.qwest.net. [75.172.111.169])
        by smtp.gmail.com with ESMTPSA id p12-20020aa7860c000000b006eae2d9298esm9467020pfn.194.2024.04.16.14.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 14:40:10 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Grant Likely
 <grant.likely@linaro.org>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, Walter Lozano
 <walter.lozano@collabora.com>
Subject: Re: [libgpiod][PATCH 1/2] licensing: relicense C++ bindings under
 LGPL-2.1-or-later
In-Reply-To: <20240416212141.6683-2-brgl@bgdev.pl>
References: <20240416212141.6683-1-brgl@bgdev.pl>
 <20240416212141.6683-2-brgl@bgdev.pl>
Date: Tue, 16 Apr 2024 14:40:10 -0700
Message-ID: <7httk1t29x.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Bartosz Golaszewski <brgl@bgdev.pl> writes:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Commit ea84f882d5d3 ("licensing: relicense C++ library code under
> LGPL-3.0-or-later") changed the license of C++ bindings in order to
> solve potential issues with code generated from templates[1], default
> implementations, etc. However this change makes the bindings less
> attractive to projects that have strict licensing restrictions and avoid
> GPL-3.0 code[2].
>
> After talking to Grant Likely I decided that the best approach is to
> make the bindings available under LGPL-v2.1-or-later and simply let the
> end user decide which version's text to apply.
>
> While at it: tweak the README to also mention that examples are provided
> under GPL-2.0-or-later.
>
> Link: [1] https://www.spinics.net/lists/linux-gpio/msg46605.html
> Link: [2] https://github.com/brgl/libgpiod/issues/72
> Suggested-by: Walter Lozano <walter.lozano@collabora.com>
> Suggested-by: Grant Likely <grant.likely@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Acked-by: Kevin Hilman <khilman@baylibre.com>

