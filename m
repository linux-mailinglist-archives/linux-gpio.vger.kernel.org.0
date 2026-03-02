Return-Path: <linux-gpio+bounces-32400-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DLpBZTypWn6IAAAu9opvQ
	(envelope-from <linux-gpio+bounces-32400-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 21:27:00 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8796A1DF5B0
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 21:26:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6DF8309604C
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2026 20:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE0FC47ECE2;
	Mon,  2 Mar 2026 20:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mail.tikatika.nl header.i=@mail.tikatika.nl header.b="Zr+rutCe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from tika.stderr.nl (tika.stderr.nl [94.142.244.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D85147DFB8;
	Mon,  2 Mar 2026 20:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.142.244.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772483108; cv=none; b=uKI1EpuHwfneFq3Pj0XBKizTZ9mjuq2jYa85XuDVd41M/Ui7Xax+LykuVggHZCCcBClHX3qYgcKZ8ZoiYNXNW1JPTTM4iNuevddXogc/CVytbrq7ppv9j4eowhfBORsvH4nM68RoN1AcK9O9sBIy/65DLjyLTOLBoOGxUGbEZKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772483108; c=relaxed/simple;
	bh=Odw8qkydcdNF0JVOnHyMy9rrHQVoIN8FWe5q008qLtI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ifhpx4IArKrXBFd/+LNUEWCN4+Al1h1B2A5+IQRUkiRrxnN2+c3KPrlLBeZOB5omvmeCpi0Vf87d78VG4xOb5C3n/phP2Z4sJ0SPqZ/fxLnWL+6nHjgSuBdD+Zfq3TgkduBPiOzrayksf6Ap9R3XROPdBFinYiRNQPN2KC8dego=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stdin.nl; spf=none smtp.mailfrom=tika.stderr.nl; dkim=pass (1024-bit key) header.d=mail.tikatika.nl header.i=@mail.tikatika.nl header.b=Zr+rutCe; arc=none smtp.client-ip=94.142.244.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stdin.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=tika.stderr.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.tikatika.nl; s=201709.tika; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Odw8qkydcdNF0JVOnHyMy9rrHQVoIN8FWe5q008qLtI=; b=Zr+rutCeoUTf+JGh7kHhJpB6Hm
	4NETxmCx1BbMqh59mLNTXmTgKkApSlVGMvz0WsS+LjGwAJEUtBPXM8CFmPxSGml64My1puOXuuuPw
	MVexNMJhAUyGZiDgQ1a2FEJfDUKrOP1vpE4bCfWmHUHq4KTv1lMqpfjeiqNDQwpWlknU=;
X-Preliminary-Spam-Score: -4.2 (----)
Received: from [45.142.19.84] (helo=zozo)
	by tika.stderr.nl with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <matthijs@tika.stderr.nl>)
	id 1vx9ls-00HGgr-16;
	Mon, 02 Mar 2026 21:21:42 +0100
Received: (nullmailer pid 198545 invoked by uid 1000);
	Mon, 02 Mar 2026 20:21:39 -0000
From: Matthijs Kooijman <matthijs@stdin.nl>
To: Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: matthijs@stdin.nl, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [PATCH RESEND] rockchip: Make gpiod pin control work and add gpio-ranges
Date: Mon,  2 Mar 2026 21:17:12 +0100
Message-ID: <20260302202121.197288-1-matthijs@stdin.nl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8796A1DF5B0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[mail.tikatika.nl:s=201709.tika];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[stdin.nl];
	TAGGED_FROM(0.00)[bounces-32400-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthijs@stdin.nl,linux-gpio@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.970];
	DKIM_TRACE(0.00)[mail.tikatika.nl:-];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stdin.nl:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi folks,

This is a resend of a two patches I submitted last december. Lacking any
replies, I'm resending it (and also explicitly sending it to the GPIO
subsystem maintainers Linus and Bartosz this time - I'm still a bit
unsure whom to address exactly).

The first patch fixes pin config (e.g. bias) done by userspace via the
gpiod interface, which was not implemented for all rockchip boards.

The second patch is just because I was messing with this code already
and had a test setup ready. It makes gpio-ranges explicit for the rk3308
instead of relying on the (possibly fragile) legacy workaround in
gpio-rockchip to add them automatically. I tested this be removing the
legacy workaround from the code during my testing.

I think the first patch might be a good candidate to backport to the
stable releases, since it makes a userspace interface functional that
currently silently fails. However, it is not a clear bugfix and I am not
super familiar with the rules for -stable, so I left out any stable Cc
tags. Feel free to add them if this seems appropriate.

Both patches were tested on a rock pi s with a rk3308.

Gr.

Matthijs


