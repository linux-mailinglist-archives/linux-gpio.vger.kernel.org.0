Return-Path: <linux-gpio+bounces-32627-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHngIJ9tqmmIRQEAu9opvQ
	(envelope-from <linux-gpio+bounces-32627-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 07:01:03 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9287121BE6D
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 07:01:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8197B302B80B
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 06:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC00B33031F;
	Fri,  6 Mar 2026 06:00:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496CD2745C;
	Fri,  6 Mar 2026 06:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772776859; cv=none; b=kay6O1D24+nAjJTTMpjBHET5naAivNXml15MyLJjo5DaC4mjSL5NETUxWIL3EYhqGceIeWd0V8FoZzWT9eOXMrGZwgkmq7iq2ZKGsetPqOi8S1PyPvVd6HGw7ma9xlRti1WPU8DZGPkMGuuhbuOo6Beb6DZ/ywnHq8sHBtkQPtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772776859; c=relaxed/simple;
	bh=0+swc4p7wLYScGWwqV+SY6jBSKkhCzAbYYROm7uIj3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o5FlS4huuHScJ3Rz0fxa04XxlUz21129z1lBu9UQ0DpE2sNQueSCiSFvA1Qdv/yHUK6SBTcNUEZp4FCo8/LQaOFIrb0qxgxbwJxwdMyKI/bYf5JjVq9JG2+Qa4EjQ3//wlOxaIC738/tiPAECYZVfcmKoNqCpGYdVKyaZ9/LdKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org; spf=none smtp.mailfrom=vimux.org; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=vimux.org
X-QQ-mid: zesmtpgz3t1772776832t4ddd684c
X-QQ-Originating-IP: JrYA07EQZGVQx8QN+R0mZapTj5ualYKFJ8w6x9knsUE=
Received: from localhost.localdomain ( [219.147.0.82])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 06 Mar 2026 14:00:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1512765761835415507
EX-QQ-RecipientCnt: 8
From: Jialu Xu <xujialu@vimux.org>
To: linusw@kernel.org
Cc: brgl@kernel.org,
	kees@kernel.org,
	krzk@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	xujialu@vimux.org
Subject: Re: [PATCH v2 3/3] gpio: remove of_get_named_gpio() and <linux/of_gpio.h>
Date: Fri,  6 Mar 2026 13:58:19 +0800
Message-ID: <E598DEE5E810E290+20260306060017.2537739-1-xujialu@vimux.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CAD++jLk3UzQKjseZz0QYFzkEtaaw9vBt8i4ggK6jNcPknVB=4A@mail.gmail.com>
References: <CAD++jLk3UzQKjseZz0QYFzkEtaaw9vBt8i4ggK6jNcPknVB=4A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:vimux.org:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: N07K9Tjq2IwD+RVquX0NNxGztWRRAdJeYOgFN5TRbYA2TGx/tkWg7iN1
	FIW0oM6mVZk1EO+Iiz1C4prq42nH9ndDpj+sOAh4M295hOROzsl48WYGOaa57iTFUOTPxUe
	XkrxNh6Gf/NZVB2soOBIrUtySDYyZeKcjaKTJC2GhQO1Qh/yt1BLL5NGql5//05uVawThhb
	c2ZYIp/Zgdbk7qSsseCfkJF954yU96ltbSZkWnIoxAVduXtjaC0+KWJ/VxNqUM73/LUxLgH
	1weHuRWdZQGO1YlwnussOIDi6GuG6XIr0sWTqh/4DHiom3fEBRoezv/s21b6fOtYk6UV3N9
	g/qu+5yDPgbVzXn9vQf9ZmHrq+XC9bzHoHRE4q+z23XC03gVN4MfQIR3qXGMOfzjrByGfiU
	fOZ1W3RvR0jU6T29NL8IF0wwVlhsJbVQUofJBdF0AXVLbWQfk/+CVdddn/wXOmdCvB7WkCK
	8hxtUNRdgluosga4yTKPuSmkRCn5NAwwkAKPC8wFJCf3Jsj9ONqE6U3WJqD5HrXV8lsdDTa
	zNtOFSjNgX7n4YyHLG2Ik/TTHVc/jnoQt3MS+bWo+rzphXX9kMgwlyw3dZi9M4AlMcKL/1i
	GS/K9yR+ZlEE23l+kfwIZ0TtJYWZkPU7GCE/vSWgeTJRvKOlkO3HLPPDo2FjN7Y6vzgLBTj
	l0JNw97xN/I5QNJI2vqz/VR8BKlv+gUi8Z18UqwWRsV1g4SfGmzyOY0KfpHkZ5FEmRkscta
	ObmyrLCqaLqBIafkdKrnWvlwuedgtleZVTxo/VAxacIys2FsZanSAsN4B3tjy0S3aoT+jdl
	qUui/01L413YOkUc4MZnR7cXqo1ALJ4THgQMRQ3TUElXrgUnMRVJzVh6+NcfH7HVgS5YSss
	gpWcoUCkeLcx5CcUGwok55E2t1t2E9AhBASyaqeRXU75lUE5xgbFxnfy1qIqQlkO3YA3w9Y
	JamA0QlwSUSwUeQaZggYopbvdX798cJSZtHxEa1KjnOYTb12/Wr024idI56F4MW/6i18=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 9287121BE6D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32627-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[vimux.org: no valid DMARC record];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_NEQ_ENVFROM(0.00)[xujialu@vimux.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

> As mentioned, remove it from MAINTAINERS as well,
> also add your Signed-off-by.
> 
> With those changes:
> Reviewed-by: Linus Walleij <linusw@kernel.org>

Thanks for the review. All fixed in v3.

Best regards,
Jialu


