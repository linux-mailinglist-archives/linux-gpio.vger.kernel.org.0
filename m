Return-Path: <linux-gpio+bounces-7780-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E29D991BCAA
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 12:31:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BF572854FF
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 10:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B481E152783;
	Fri, 28 Jun 2024 10:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OzWylxaJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DEF249F9
	for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 10:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719570685; cv=none; b=TxDX6EqXKAmHT9A281iPdFi0iNnmtinECafuQE9lPAoo7/dPZh6ca082+p6Dd9hCjbMbRgIWgVBY21SfUp3Q1suLOVntG+cZMCc4OTGWScH1DHq9rJyfRiyDynwG32e8KlBFuu4FRb24zoG0WAlYN3k3TKeuXs5IUozhVrHPDyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719570685; c=relaxed/simple;
	bh=vEvLTwZT8bo1Z7fz/WFEfSapz1Y+9TVoKF5DFvgEcX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LqyzIwJdwp6BtS/Xjh5tXfW1w42tZrOAJOvUlo19NCGFSSrNFopnlIr3DeOnAnKvwtgP1kmqINPH5w3aAdp/NJl61apU+2Jw/UlFSdsZAXO8G5KqX0yRsYQGsBAsXrBoy+xHTPNku2qePbb86IZIYHAb80CnebvwUey5xTIxsoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OzWylxaJ; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-6e7b121be30so290027a12.1
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 03:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719570683; x=1720175483; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xqj6EjEthBQ2zRB0FTnH3hQqBfMf+O8jiMLai4BghP4=;
        b=OzWylxaJos1Eaj35ajbdsGxB7aekhbZQmjTeSaBbtZOXMRSgHrbOq3byFvZbY5zXUw
         N5+qOjarVdznsWBUQXWLvOZqvhnthbLaGiAvZFB9EnDiBe0bU8MbvD4yJW4EoRloik32
         tVy4VdGPBtlPdPLKfK6OMV/uNGEgp5t6qqGByIZdSDDqKfhuTT1L7OsBghZFNFC+zNY6
         j/JFw4SQwTkDMEl/gizz2ON+vsUsL+NWj7IlZ8ucaFpVrAB15qU6BvpB//5jFjY24uc7
         UyDFgP1p5mW6bn0lcLwB1/Zm6gD3CxlVfziXbekq48am9NURYqe1ikOG8CQCLjkrfmCA
         PR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719570683; x=1720175483;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqj6EjEthBQ2zRB0FTnH3hQqBfMf+O8jiMLai4BghP4=;
        b=WdS8qUUzUn3K9+H22H7H/o6aFUlDAdeWupRsU4ZzxxHNX+TD+Z12h3ENRuEh1a9WG/
         wnUxH+ZW+QVnjdel0oN+qW+4d6cNYkjF3kzvw6ws3N8kQePRHKa3C5Z+VJCsiC5pwK1h
         bqO5H1kcH8zObubOTT8H9eHRbiWu0ToQKWYpPpTd5JYRh9/stSoy/DEfCAdV8pqRPLom
         q0zYuvotVG6KVJvdtqjioUIZ99cz3b9O7yh2QiAQukjdb2z7lD0iY6uOr4dp9UanVAMc
         l1H/VQ/dVUn+FAnEDjcAPV4xGpEA1sQD4k48VLN+gagz+HxaI5Nu2KPyZL2jpOzet/Rf
         srdw==
X-Gm-Message-State: AOJu0Yze71Pr3m/fAnhd/6CysgDdgLwamtNHPWlqijapUkQSGSGOPyHw
	uK5HaUk8jTtFVuA/+zntusPvhb3nA1YivouxHUGWIIiQ0+2Cn0xk
X-Google-Smtp-Source: AGHT+IGYBpls1LH8bXRNigEdK9YxQVSgsoALPWC2D5PoT+xBT/7U+3Dez0W1cHBplIe/HXw3IPZjBA==
X-Received: by 2002:a05:6a20:6387:b0:1bd:1e0f:efa3 with SMTP id adf61e73a8af0-1bd1e0ff0dbmr9790848637.4.1719570683149;
        Fri, 28 Jun 2024 03:31:23 -0700 (PDT)
Received: from rigel ([118.209.204.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91d3bcb30sm1276461a91.41.2024.06.28.03.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 03:31:22 -0700 (PDT)
Date: Fri, 28 Jun 2024 18:31:18 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Chuang Zhu <chuang+git@melty.land>
Cc: linux-gpio@vger.kernel.org, Chuang Zhu <git@chuang.cz>
Subject: Re: [libgpiod][PATCH v2 1/2] bindings: python: tests: add a test
 case for line request by name with multiple entries
Message-ID: <20240628103118.GA56487@rigel>
References: <20240627153103.594107-1-chuang+git@melty.land>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627153103.594107-1-chuang+git@melty.land>

On Thu, Jun 27, 2024 at 11:31:02PM +0800, Chuang Zhu wrote:
> From: Chuang Zhu <git@chuang.cz>
>

Add a commit comment.

> Signed-off-by: Chuang Zhu <git@chuang.cz>
> ---
>  bindings/python/tests/tests_line_request.py | 34 +++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/bindings/python/tests/tests_line_request.py b/bindings/python/tests/tests_line_request.py
> index f99b93d..c9a5c81 100644
> --- a/bindings/python/tests/tests_line_request.py
> +++ b/bindings/python/tests/tests_line_request.py
> @@ -310,6 +310,40 @@ class LineRequestComplexConfig(TestCase):
>                  self.assertEqual(chip.get_line_info(3).edge_detection, Edge.BOTH)
>
>
> +class LineRequestComplexConfigByName(TestCase):

Nothing complex about the config, so LineRequestMixedConfigByName?

> +    def setUp(self):
> +        self.sim = gpiosim.Chip(num_lines=4, line_names={2: "foo", 3: "bar", 1: "baz", 0: "xyz"})
> +        self.req = gpiod.request_lines(
> +            self.sim.dev_path,
> +            {
> +                ("baz", "bar"): gpiod.LineSettings(direction=Direction.OUTPUT),
> +                ("foo", "xyz"): gpiod.LineSettings(direction=Direction.INPUT)
> +            },
> +        )
> +
> +    def tearDown(self):
> +        self.req.release()
> +        del self.req
> +        del self.sim
> +
> +    def test_set_values_by_name(self):
> +        self.req.set_values(
> +            {"bar": Value.ACTIVE, "baz": Value.INACTIVE}
> +        )
> +
> +        self.assertEqual(self.sim.get_value(1), SimVal.INACTIVE)
> +        self.assertEqual(self.sim.get_value(3), SimVal.ACTIVE)
> +
> +    def test_get_values_by_name(self):
> +        self.sim.set_pull(0, Pull.UP)
> +        self.sim.set_pull(2, Pull.DOWN)
> +
> +        self.assertEqual(
> +            self.req.get_values(["foo", "xyz"]),
> +            [Value.INACTIVE, Value.ACTIVE],
> +        )
> +

Add "baz" to the lines to get so this test fails as well - expected to
be INACTIVE.

Cheers,
Kent.

> +
>  class RepeatingLinesInRequestConfig(TestCase):
>      def setUp(self):
>          self.sim = gpiosim.Chip(num_lines=4, line_names={0: "foo", 2: "bar"})
> --
> 2.44.0
>

