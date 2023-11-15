Return-Path: <linux-gpio+bounces-120-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BB27EBB19
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 03:07:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EBD41C20AC6
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 02:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62A9839F;
	Wed, 15 Nov 2023 02:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB690642
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 02:07:48 +0000 (UTC)
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F35EAFA
	for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 18:07:46 -0800 (PST)
Received: from localhost (88-113-24-34.elisa-laajakaista.fi [88.113.24.34])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id c3e2a2f8-835b-11ee-b972-005056bdfda7;
	Wed, 15 Nov 2023 04:07:44 +0200 (EET)
From: andy.shevchenko@gmail.com
Date: Wed, 15 Nov 2023 04:07:44 +0200
To: "Aiqun(Maria) Yu" <quic_aiquny@quicinc.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@quicinc.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: avoid reload of p state in interation
Message-ID: <ZVQn8EpU8UrFMm20@surfacebook.localdomain>
References: <20231114085258.2378-1-quic_aiquny@quicinc.com>
 <CACRpkdYgyASV6ttW=AeAWSh3oiFDk9_Q1WV00=7yTxtuhpdXEg@mail.gmail.com>
 <94de6d83-d181-4a04-875a-377fb5e10b25@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <94de6d83-d181-4a04-875a-377fb5e10b25@quicinc.com>

Wed, Nov 15, 2023 at 08:56:35AM +0800, Aiqun(Maria) Yu kirjoitti:
> On 11/14/2023 9:21 PM, Linus Walleij wrote:
> > On Tue, Nov 14, 2023 at 9:54 AM Maria Yu <quic_aiquny@quicinc.com> wrote:

...

> > This makes sense in a way, since this is a compiler-dependent problem,
> > can you state in the commit message which compiler and architecture
> > you see this on?
> I have a crash dump which caused by this issue which is using Clang 10.0,
> arm64, Linux Version 4.19.
> Thx for your suggestion, I will put this information in the commit message.

Please, also add a kernel version and a few (most important) lines from the crash.

> > If it is a regression, should this also be queued for stable? (I guess so?)
> This is a corner case which is very hard to reproduce in product, I suggest
> this fix to be queued for stable.

Please, provide a respective Fixes tag.

-- 
With Best Regards,
Andy Shevchenko



