Return-Path: <linux-gpio+bounces-33202-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OO5NO5zjsWksGwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33202-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 22:50:20 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FCB26A914
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 22:50:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0122630457D2
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 21:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39D193382F7;
	Wed, 11 Mar 2026 21:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UWxX5Z78"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1635310620
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 21:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773265816; cv=none; b=o6d4erW7pTs3c7bZYmNNT3NhslsPK8WmmPgSVGacN/qSLFV0cDRiwDYXUT8dhbpZk7m33fIgQxXHOZee5UuAqVFAu0NFzkxVdcEQ6O62oLpjDy079zisdJeZy72oKwsQvQIw9irjpxOOxCx88tmYNZLdHSwnsX6CrNREjiS3dIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773265816; c=relaxed/simple;
	bh=m2krFFJbAA0uEB9W2n2WCPL8P86DVDWnZTduVYzUqIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tESt9vG3qCMElcYQWtDPdkzO0Slcd4uw/D5kkja8fvSSvVeeLQXfEjJbmniD4/13a5l7dXXZTDHZmn+xhlXlhFlTww8+2owr+TOVI/iWbZwIplQDhAXquZiFYylzX/X/TA2joJ7yXqnE+t8zrnVId+p7MkfGpuPNLgnxjdkL2Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UWxX5Z78; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98857C2BCB2
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 21:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773265815;
	bh=m2krFFJbAA0uEB9W2n2WCPL8P86DVDWnZTduVYzUqIc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UWxX5Z78qjOx4LHQuEPYmjjcZhdJRQtgLXBdL/guZRXdrNpMI9whDGmxsevEYI9tR
	 de0QAg10xoTgUjlW9bSNODMWouh6YKIq62HkUkAz0PowJgJIe46wu8CcdBK3shQOin
	 QWi/Ssk2+zVwyIHEd/tQ+HWNcGknloUeq9NLTPLfdcMKKDxpBwBsaZXAsEdN7W8WfF
	 fKDI78XeYNxlrJewaxmmeFV4js65RpK+F84vd+4HicHiIwqnWtUsn+DdTp1Quf8W+2
	 C7/yQSQDQ9nck9iuk945LV2iQle2QVtoLgElpPnsbP3eG9nVPbStq0SzcPR/0sV8si
	 hDmUrpQDoMplA==
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64ae222d978so503321d50.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 14:50:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXr5Ss2CPxWHLsqkUQb0G9jI46GYVuFpEKCTER47bsOm9iEeb1/dgSYgIMUuMRwRCSoZpv+VRqrPM0t@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw7l2R92HAQPNXQRIxm/Rk0ICuZbfxFvdnc3cvz0dBoIp+iw1F
	UcGTfOguPqYt4pTNO8eUp5RM9cpZ9jDJx/K89hJ6jShB5byYjiA4VvuLJ3Vgenw8EhzvHAQsulw
	M5AsigHgdc9ZI/8bbJw1jvF9gh65AMJU=
X-Received: by 2002:a05:690e:1b54:b0:64a:f138:3187 with SMTP id
 956f58d0204a3-64d65817d1cmr2757338d50.86.1773265814879; Wed, 11 Mar 2026
 14:50:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1773150895.git.dan.carpenter@linaro.org> <e10b198aa9ed7a9cda6d0e9033a00d1c700ecf9b.1773150895.git.dan.carpenter@linaro.org>
In-Reply-To: <e10b198aa9ed7a9cda6d0e9033a00d1c700ecf9b.1773150895.git.dan.carpenter@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 11 Mar 2026 22:50:04 +0100
X-Gmail-Original-Message-ID: <CAD++jLmajaTugcp2LxO62w0p+1+S6YRPfOT3BdCirrvN5RqymQ@mail.gmail.com>
X-Gm-Features: AaiRm53dpQ77aEmUV-pKlw3bjukzFCu41Gx2sWGVLP_b7CPBtnYAHiBxA564ABQ
Message-ID: <CAD++jLmajaTugcp2LxO62w0p+1+S6YRPfOT3BdCirrvN5RqymQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] arm_scmi: pinctrl: allow PINCTRL_REQUEST to return EOPNOTSUPP
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, AKASHI Takahiro <akashi.tkhro@gmail.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,arm.com,vger.kernel.org,lists.infradead.org,intel.com,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-33202-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 52FCB26A914
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 8:39=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> The SCMI protocol specification says that the PINCTRL_REQUEST and
> PINCTRL_RELEASE commands are optional.  So if the SCMI server returns
> -EOPNOTSUPP, then treat that as success and continue.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

