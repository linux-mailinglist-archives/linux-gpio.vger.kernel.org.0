Return-Path: <linux-gpio+bounces-33099-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIExGgU5sWkLswIAu9opvQ
	(envelope-from <linux-gpio+bounces-33099-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 10:42:29 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 11844260F54
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 10:42:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB709334A337
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 09:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EBA03B8D48;
	Wed, 11 Mar 2026 09:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IK9qaKAc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3CC3DE421
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 09:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773221113; cv=none; b=Kh2Lha2nxPt0BDitDlSblrtX4/GHJvb3lYwcXZPwhr0Ru2iYQf2WYxe/A0ijnHZHLlFiqHATPh5ibDxBOKVhqRlqyMrixSbl/ctQm9OHgoxhoc390FpKfg54LACsUpI0r0nxCK/VsqnuBhIU8Y0UejVfKup9B5qPBtRJ6OEFId0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773221113; c=relaxed/simple;
	bh=01GKf65j/jScrwoKQ+C2Gxr6oYYNcBqF+y3kaUEjbLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L2Xyc/I9hTRF5wm7cBifkxgbBbgoxqjDoN8E0NxtcE+OCgSWxeIThV7eHOhYluLjaXuIrv2AdfB9CEydEWhEaybMTG8OQLgcj9+mofMQcIFTPvSFJci5rvrZviPRefbz+T1+F4O2TjISAnY5VIu6Ddnq4IyJUJSO9LaPXl0tzfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IK9qaKAc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 013F8C2BCB5
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 09:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773221113;
	bh=01GKf65j/jScrwoKQ+C2Gxr6oYYNcBqF+y3kaUEjbLo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IK9qaKAc40x9w1tTnDGK/5LfwtlPgFMQbzLlkR8KIJgzQd5uLNQvBbpMt2vh78Hdf
	 uGFIdbEEKhpLM7kwrYSqd/d6UMtbhBEQn6P8nswxyoNEodBRhoszprfEvS+TvD881+
	 KFaoGOWRRavp+r/ljv2ths/HESZBtfyYFBrTiWerLSWzV1GJ6IEITEuhK9bbwbRQrm
	 JSrEUBKRCmA4D7VowIA5CT+EyZhNq2ZFR6u9nqkXA7vxtLKcSniNmqjqfUsh5kdNp3
	 Yb95HaLUCp2J00ygi8cr6kBVXzHmTqlWtuqzhw9aLMoq9bG1iIIGd1/ZYY7er6CZid
	 6upOZohwnPaqA==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-79800183233so11822547b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 02:25:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUZhLV9D7zSR5cl0HePAZXHURAVTR1DQJ+FEI71u3svJaMDoWAzlasTi/c7ohI42Wi2seDy2uoqAQeG@vger.kernel.org
X-Gm-Message-State: AOJu0YysmUFX9Z5+LGIXnItwbDuz27YQ930f/pVpAFaDHBhstGxm2C51
	jwHvXBeNuSRxpII0OXqGPs0qpO7qW/qFROv/LK6bhCutNBRc3UuQPgceZbCzVYSXZ1+I6YPNpKe
	8QBJGe7o+5/O+AP/BW1Vgb0TH/DETwZE=
X-Received: by 2002:a05:690c:6d84:b0:794:f400:2bfb with SMTP id
 00721157ae682-79917f593b5mr14822137b3.26.1773221111798; Wed, 11 Mar 2026
 02:25:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310075539.11701-1-wsa+renesas@sang-engineering.com> <20260310075539.11701-16-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260310075539.11701-16-wsa+renesas@sang-engineering.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 11 Mar 2026 10:24:59 +0100
X-Gmail-Original-Message-ID: <CAD++jLkoWCcBvB4G-2EDYU4kezPhVF6943TY6PmK5ooGwruLzA@mail.gmail.com>
X-Gm-Features: AaiRm52-5ccgCpLSKuxxaehFi73jWhXjY0Lv_AX860GJVRZU0Kw14nXERH-rf2Y
Message-ID: <CAD++jLkoWCcBvB4G-2EDYU4kezPhVF6943TY6PmK5ooGwruLzA@mail.gmail.com>
Subject: Re: [PATCH v4 15/15] hwspinlock/treewide: refactor consumer.h from
 public header
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Lee Jones <lee@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Waiman Long <longman@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Thomas Gleixner <tglx@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Arnd Bergmann <arnd@arndb.de>, Srinivas Kandagatla <srini@kernel.org>, 
	Antonio Borneo <antonio.borneo@foss.st.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-iio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 11844260F54
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33099-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,huawei.com,linux.alibaba.com,infradead.org,redhat.com,lwn.net,linuxfoundation.org,baylibre.com,analog.com,gmail.com,foss.st.com,arndb.de,lists.linux.dev,st-md-mailman.stormreply.com,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,huawei.com:email]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 8:56=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

> Factor out the entries only needed for consumers from the generic public
> header. This allows for a clean separation between providers and
> consumers. Also remove contact field in favor of MAINTAINERS entries.
> Fix the users, too.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Acked-by: Mark Brown <broonie@kernel.org>
> Acked-by: Jonathan Cameron <jonathan.cameron@huawei.com> # for IIO
> Acked-by: Lee Jones <lee@kernel.org> # for MFD

Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

