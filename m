Return-Path: <linux-gpio+bounces-10886-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D40991A24
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2024 21:55:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F475283C93
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2024 19:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77893158DCC;
	Sat,  5 Oct 2024 19:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="tG8BkyyC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1739C130AC8;
	Sat,  5 Oct 2024 19:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728158106; cv=none; b=UA26ddkF5deT0yNwEVgDKcRmrjy4yWhqrlCzPD3BubtMWVYTO8EyGR9yoOZE+5OUxcfNPUY1ZU57LC1lNGKMzfo8eAk9fr1zJHCuFmAXSs7A8bx2j2Dij2OAOPLgaFs+fzZzrZ5SAiushwfIARuvL89iZPtj0fC7M4ri93ftbf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728158106; c=relaxed/simple;
	bh=XiRgGL0XWUByx5kn7nI+Tco3WgxYx8RWawJzD97E6YI=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=tIONsdVoebJpcSe/yHhvszV8JKh/iKgaLyB1SDdlkFYNBZFL8JmdlkW07Y2879r0yVsDOHoH3QuqahP6PwJHhA2hmMO4nobg5O+Vn1hzNLQ3ZprEirgmxgykfL2ar86+1nj5JLvLjHlijBJnYJLzaQSFNYXwaFi36OLSvI9IfnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=tG8BkyyC; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1728158082; x=1728762882; i=markus.elfring@web.de;
	bh=XiRgGL0XWUByx5kn7nI+Tco3WgxYx8RWawJzD97E6YI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=tG8BkyyCyzZhaT7ac3zn3ZLenl0gCu2oZ9+yCdhcEvQ7fGO7cJIItVedOupoTYHe
	 Vv0R8i0GAu+dddr+wIuTtRtqjNNPC5oOznwueuKysBvmGp6I7y88E6GiLRgxBiCip
	 wbAmVvgkETeqTUMtzSbCsVH428I/hJO8baLX3DUTQ4p1jGI5WE+Z5FxNpMZt/Zs6I
	 E0cba9vcCzHwg96WtOgqYuDlPFN5c5UaWpY76HQSdIByF5fI/wd+nl/ouQ9AZOHVh
	 Zac0nRhn2aI4S1JtuxV9bRA0zgqaJLDOfoAGTl91JDTKw10KYwaESJCv56SJ4pbST
	 z6oazykU7fl7qKqKqA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N14ta-1tzTlg16WQ-017FyV; Sat, 05
 Oct 2024 21:54:42 +0200
Message-ID: <e7ca4426-8434-4516-9361-c74e73a7f8bd@web.de>
Date: Sat, 5 Oct 2024 21:54:34 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Drew Fustini <dfustini@tenstorrent.com>, linux-gpio@vger.kernel.org,
 linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>,
 Guo Ren <guoren@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Drew Fustini <drew@pdp7.com>, LKML <linux-kernel@vger.kernel.org>
References: <20241005-th1520-pinctrl-fixes-v1-1-5c65dffa0d00@tenstorrent.com>
Subject: Re: [PATCH 1/2] pinctrl: th1520: Convert to thp->mutex to guarded
 mutex
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241005-th1520-pinctrl-fixes-v1-1-5c65dffa0d00@tenstorrent.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:L1xTGNTpMfBwZHnEWbpNfA/GhqDYBd8sh779FOBV/qcakDLVyl7
 9m+X5pQbOVme+hCyZo8j9ob7FP4FOgJGapCqwULxjE34FuHRRKZ2umGG7TfG8cZHQAkFBqo
 o/+UFZxLCD4P+W4fzpOPrbK9FsX3a6XuhkFbnqYXO4ceUSt3ARer73tJWDy86XhKbdIpwqr
 bfzcPGfB5T78v2QXIi3UQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9VZ7pMe4lfQ=;RvGZu1eAHN96lNtvsvlc5ajc5o9
 Bhp/ZvSkoQYXkMXd3jYIuKfy9ysq7h+dYQ+Uz+/MWUkq3MyMO0nerHdzO1Kyzid3Fz6AS6TO7
 5hzlfl+5QhzS5gjKqNrd7gvEGIa5f/1euLxEgcVEiexB1b7MOOuMtKUAW7oUs2T5yG7Wn8bV9
 cWuLY1YV+x+AdHDl4qzPNLqNDWqdRRaqSUBIXLsOU2oh4GH+RiIv8zXaX1FoYSZqXHSFtXEty
 CG+CPbUPmx1C+MNCmkYkiU7c0919HLSJa5lwfzbhqGgx317RfvjFFG6XiqBu+7m1x0IFADvvM
 hvqLCDdjKC7lP6GuncQC9fFuq0lFL5YseStQNSfhwjYO60qAI+U+o+j6xQV5yLHyTvRl29FEI
 ELielZuQs2gMXTv6AcOpGqeqNseO+sHx2Jay2eqF2DuxFb0LrInhw9xyQunjVxEN9CLgwRrWu
 ql4b7HpGY62N0PgRWU7PWDwettio1o4COmAPLfpKD0cf3VTRmSRs9nlnY1ziQ0H1X4xshzkHk
 ecTZhj6PFgUMHP7NI0+olkPslk/sbjcvPStIVDl4wfxvXjmGjTg6kAFt0Zy9qfjzOhzPri92F
 Jxop1KL/e++eVXSMKIee1VWn1AmSfmg27so9Mlj8hSnDwzGKG00KFqt9oftLYw4YZfpL2/rQ3
 Qiv03KhAaFLSDPnYnWiIwyr6Pk6QZviKWeEcILPJfq2Gm5iY4Rg8TyLXrqBTiw5GvyHpzvNdn
 xPTy/nEA8dXUxFhPDBySeeobNnB6TrxZkuzLy9AAbVgMGDckfwR2U2WnQENH8d2JaNqptmBCG
 /hPvdtucnraAMJgkuCseEa3rUgWrOpv76mJYa6a0usy9c=

> Convert th1520_pinctrl_dt_node_to_map() to use guarded mutex for
> thp->mutex.

How does the proposed usage of the programming interface =E2=80=9Cfor_each=
_available_child_of_node_scoped=E2=80=9D
fit to such a change description?

Would you like to omit the first word =E2=80=9Cto=E2=80=9D from the summar=
y phrase?


Would you generally like to increase the application of scope-based resour=
ce management
(also in this software area)?

Regards,
Markus

