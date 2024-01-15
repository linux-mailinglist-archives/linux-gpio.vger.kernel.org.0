Return-Path: <linux-gpio+bounces-2259-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 583CB82DDB0
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 17:36:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3FF81F22624
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 16:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E6B517BDC;
	Mon, 15 Jan 2024 16:36:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000C117C60
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jan 2024 16:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 560E2100DCEC5;
	Mon, 15 Jan 2024 17:35:55 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id E988740EC3; Mon, 15 Jan 2024 17:35:54 +0100 (CET)
Date: Mon, 15 Jan 2024 17:35:54 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpiolib: Fix scope-based gpio_device refcounting
Message-ID: <20240115163554.GA4205@wunner.de>
References: <f481d5bff884c16606cbe577e707e1c1c0e6ccb2.1705330861.git.lukas@wunner.de>
 <CAMRc=MczKMSY48y3xC-0rah0sOP_OP1Ln1qu_QCCen504q5Xog@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MczKMSY48y3xC-0rah0sOP_OP1Ln1qu_QCCen504q5Xog@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Jan 15, 2024 at 05:09:05PM +0100, Bartosz Golaszewski wrote:
> On Mon, Jan 15, 2024 at 4:05PM Lukas Wunner <lukas@wunner.de> wrote:
> > While at it drop a superfluous trailing semicolon.
> 
> While not strictly needed here - I think it's better for readability
> to have a semicolon following every statement. Any reasons for why
> dropping it is better?

I looked at all the DEFINE_FREE definitions in Linus' current master
and this appears to be the only one with the extraneous semicolon,
so one reason is consistency.  Another the avoidance of the illusion
that this is a proper C statement.

It's basically an empty statement so it doesn't hurt but it doesn't
provide any value either.

Thanks,

Lukas

