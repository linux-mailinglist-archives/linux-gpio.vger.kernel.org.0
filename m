Return-Path: <linux-gpio+bounces-34747-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHlWFpqq1GmKwQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34747-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 08:56:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9113AA876
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 08:56:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58619300CC02
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 06:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF4038C2DE;
	Tue,  7 Apr 2026 06:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S/1ZmA3U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2A138B151
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 06:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775544814; cv=none; b=HeDfuJDSrO2bKbh8RwuspcrBUeREIlvV5gc4unG08lVkB+mU23HuU0ILUteIFShJM9cguNepVSoIn2DGSdxhK1f8OzabZ4zNslaDVGSQeqtsyTiKc8AW+kMZWWIBnTqLC6n2zhSWzheBWsbe17RBbmE+UuFs97Je/4ghc1aMMQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775544814; c=relaxed/simple;
	bh=2pdD9n0MqzM+jSWRsy6FL+kHqer/9QDDO46VJLSG5es=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o/2XYM/H8jpPIFYshXLrPPDm0l3M4g+qKcZuRgyj0xAyNqcCD/mLFZbCkvFiDMP36nmZgGkuM91h7EIe1fxemQQ3ezoSCmcBeuX9AbhxiJZhmLnjTrbU+w8ihulNzg18xIgIEVuYYYGzB7CTmFR1OzG0Ob+k0B1hmMsYNb2MmaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S/1ZmA3U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2466CC116C6
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 06:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775544814;
	bh=2pdD9n0MqzM+jSWRsy6FL+kHqer/9QDDO46VJLSG5es=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=S/1ZmA3UK6EbmHGVHNRTXFAmZtGMKtTTtUkx+w8MOTRUJ98s/ui2ubxVV+5F6TCEn
	 BpIelaF2MmuEaOi+MTQFlEzcbIOZ1tMpv01SVmbl2H29zgVkT2MsuesL1WK5Nryjuo
	 Y1NefmfUZ+m8Oah6kuDNAgZKqNumgZB+7DK9gyK/rEr4+8DmqoUIsPecD0W7KvOdhE
	 X17wgNLlg/LtIuLwqunBMt6nOegXL1pLtPOQsoEMZ58+CQVfRWAdDh/RgT4BKdPsBD
	 92EcGnEeWX5J5inYQV1wtcwYbVUdGF9YPySbF+2Pv9yoCcjN4wP20s5bI5+BJkqqvk
	 PQq3yw0BWaXzg==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-799001d73bdso33470557b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Apr 2026 23:53:34 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy1GJdi/+w8sD2heb8bvWc8AilH21tnxKbHYF2U8HHHowZKkSUI
	m3YR2iBa+f0ORUqtlnDu7kib+mhUjLaEzF5WmECl6PAfEzFcmEcAoYOCy0C3wjqqKYjVgcnIHST
	qX+AClrwVNlrqFkLTygvuhZNU2R+U2pw=
X-Received: by 2002:a05:690c:c36e:b0:79a:dae4:5848 with SMTP id
 00721157ae682-7a4d3ec9a5bmr125953677b3.20.1775544813604; Mon, 06 Apr 2026
 23:53:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ac07MgfZtcVG-zQ3@black.igk.intel.com>
In-Reply-To: <ac07MgfZtcVG-zQ3@black.igk.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 7 Apr 2026 08:53:21 +0200
X-Gmail-Original-Message-ID: <CAD++jL=RbfXAYSRoQQFagFBUMfJKhoCDvH4dCeuYKn2MHZUOCw@mail.gmail.com>
X-Gm-Features: AQROBzAJrNep7-YX9DFnUWsZxYZIPFDw-3wHTasDE9nGwtMhju6SVe-2Q1H7a3I
Message-ID: <CAD++jL=RbfXAYSRoQQFagFBUMfJKhoCDvH4dCeuYKn2MHZUOCw@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 7.0-2
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux pin control <linux-gpio@vger.kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-34747-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: BD9113AA876
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 1, 2026 at 5:35=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> A few fixes to the generic Intel pin control driver. These have been
> for a couple of weeks in Linux Next without reported regressions.
> Please, pull for this, v7.0 cycle.
>
> Note, they don't have the Fixes tags, but since we declared Nova Lake
> support already in v7.0, it will be really nice to have this PR applied
> to the current cycle as fixes.

Pulled in for fixes, I'll get this to Torvalds pronto.

Thanks Andy!

Yours,
Linus Walleij

