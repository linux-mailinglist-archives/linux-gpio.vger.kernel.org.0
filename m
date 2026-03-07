Return-Path: <linux-gpio+bounces-32712-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KUjJGuXq2l6egEAu9opvQ
	(envelope-from <linux-gpio+bounces-32712-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 04:11:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1E0229C6A
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 04:11:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CCF83049245
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Mar 2026 03:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A187A2FFDEA;
	Sat,  7 Mar 2026 03:11:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C491D286D4B;
	Sat,  7 Mar 2026 03:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772853090; cv=none; b=dQEGHbhALzak3RMUNx8O6S5NSH9rODBxyKaxXm47dU22boTaA5rEGmrssTrkF9wNVQh/GetTk8l7nPTekRCJqNBoK9W2VRjr02i3sNDk4ajmEhy70qXXSsszzxnyKpyhSZRzjDxIJ+03+VJ2Vh7EXxIWxg3jEh2E0WFT8blkvxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772853090; c=relaxed/simple;
	bh=oZ4sxB0KXBa3uNhJFwFEMwbWKpO1eMNUrPouuziPVYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q2A7phB8kvBo+YSBJ8yj2qDDwMg6LTqE4eRAonM1rnrqfldPp6XVdglnceAi8G2Sb/kkhWRW0fBQqadaTzTzTkkTiD0N8hfDNAWWSAyvMn6KRPTMtYZAX3wKvzsy2MhvdkSfn/NhS3g/TuaVgx6BLFM5aN2RFjgdakipwPcZbwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org; spf=none smtp.mailfrom=vimux.org; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=vimux.org
X-QQ-mid: esmtpgz16t1772853063ta57ab99c
X-QQ-Originating-IP: vB/6+i1kq4fkEiI6IipUB7zsUNU9dy0rQFjm84eTHMg=
Received: from localhost.localdomain ( [219.147.0.78])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 07 Mar 2026 11:11:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12635600104567615987
EX-QQ-RecipientCnt: 9
From: Jialu Xu <xujialu@vimux.org>
To: kuba@kernel.org
Cc: brgl@kernel.org,
	kees@kernel.org,
	krzk@kernel.org,
	linusw@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	xujialu@vimux.org
Subject: Re: [PATCH v3 0/3] Remove <linux/of_gpio.h>
Date: Sat,  7 Mar 2026 11:10:06 +0800
Message-ID: <5DEB1FF282233DD0+20260307031057.3497931-1-xujialu@vimux.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260306184023.208897b4@kernel.org>
References: <20260306184023.208897b4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:vimux.org:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OAwMxLIGnK8Sa5iYdinAhG7XKn7DpAftXqWgLPjY9fKJC/as8Mfaqe3K
	pRrWhvWH9xR7V1PNdz5O3W35EFWTSNwIEzuIR1nhm7Jo0xm4P5H+EJBiTuOmZiOmBT3VYcT
	sMIsh8x5fQX6AO+x0qy3IVA9lzJ/qJZjx2C4qzUdcCAGcMkn4T4ozkyr100kbgOK+TxCfCR
	8R0zZqqPzpc3loWy5J/WVAFT1TQt9Ihv7WqpQUBQIlhiv2S3Xe/rajAGyKutSDv7135uJ4Y
	qs7QJpdsm6hwLhZAOemq1a2l8zYptNfxgJ7thQXicgPsjJF8Jd68pM2ARYYeihoO9Y+/75J
	/3KP+F8FIMPlw7qwyNI9xmrI+7MVVNLhNM/BbB7xhh94xxaO7nTpTi2UYd/9KCHMbPr5yy2
	6UazMgu3VTUNYHFrBYdWPHYhorcmxfY5xcWv2OcthV0MBiFUKBaTdOihV7YaDHOoXwQWF2X
	HfCMgwv8FPi436vj518hA3vWPjbO/uT4U7CYVCvV347Oki4kHE3iefFIvIRMpF7U/gea+M8
	QY0ykQbyPM3lv6dAusuDBkbhNN4Y73YR79ISB1v4l5CpdssHPUKpSUVIdkTIGVLl+dqTCYL
	Uy4t7eVuNc0428byhWe9zwuv3dri3LPuKXxviShobTV8gC238/W4nNYImc+q+LkiTNjppYl
	aRv9Hud26N6+x1FY5wzxXYQR9DKZ7RjkgPJGySkVTtnOadOd/tnyzjIkEybdBpgVaL/JUi4
	YU8wXP49OABnqu8RbqWNpz3hmWkVaAqnx+bwHbzPLX7wxTchAgWqzWNUZ+ZN/lm1HXDU0a5
	hJi4J3+ZiaRtzNW7PU3mKbpvQJkBRovTD38VX4v3E8rNRt1UwnhqN375nL7qgfy8wTqKjKx
	wgwzFaJvIn3KgpkimywiJHXlfDRFVWNQ/nxWjBQtTDoHbmMS61QGiLwZ9go5L2CZbBqdcjJ
	z1GLkMtjvlpaewxugoJtXAK1a+73lOeZ/UvZ5qFPQPlTKrkw/bACE+J7jn3xLt2TpGjYBhy
	kJXeW+X77uwcC0fTvzYRys8xLchmY=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 3F1E0229C6A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32712-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[vimux.org: no valid DMARC record];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_NEQ_ENVFROM(0.00)[xujialu@vimux.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.384];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vimux.org:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Thanks. The issues you pointed out have been fixed in v4:

- Initialized reset_gpio to NULL in nfcmrvl_parse_dt() to avoid
  using uninitialized stack garbage in I2C/SPI paths.
- Used GPIOD_OUT_HIGH and inverted gpiod_set_value() arguments to
  match the active-low reset line documented in marvell,nci.yaml.
- Fixed continuation line alignment in s3fwrn5.

Best regards,
Jialu


