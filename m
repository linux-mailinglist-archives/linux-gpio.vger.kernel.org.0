Return-Path: <linux-gpio+bounces-34646-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFHWEFbEz2lH0QYAu9opvQ
	(envelope-from <linux-gpio+bounces-34646-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 15:44:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D03394A5A
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 15:44:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D836301CDBE
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Apr 2026 13:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F1C3364959;
	Fri,  3 Apr 2026 13:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yf+Sa9Lp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6157388382
	for <linux-gpio@vger.kernel.org>; Fri,  3 Apr 2026 13:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775223865; cv=none; b=R1wgGsE15aiQUAXi0PFw9T0IewVFHrCzuAk06FMWmXD/ifc+FGc6YUt3nm2ETCb/XkKwYjE4iI4WEHBX8KemaBD+Y7rZAniEloIitzVv4DM7GeO1z2XF1iBgT9ZOl9VZn0uk71PyDfcdqGsic420nLY16Eo0a8WPvCFimIDykp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775223865; c=relaxed/simple;
	bh=6t5r9418LvagyoUOMjuFHRfkHnMedtZ6I0B3/J6r/BU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bpQC0/RC8Mgwq1TxkTREgyO0xinIWZsDUATyAG+3JGfHudBW08XxMPUk4r+TMjlraB8VbZEcph+4TkvcIas68oAYuOOgqspHaDE+o0hx+kr1I3c8wvQ3joXkIGg7uTyvy2arCM+2UgX2xLwIjdtwuX4DLf50pms99LlNaO9bRZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yf+Sa9Lp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9622EC2BCB5
	for <linux-gpio@vger.kernel.org>; Fri,  3 Apr 2026 13:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775223865;
	bh=6t5r9418LvagyoUOMjuFHRfkHnMedtZ6I0B3/J6r/BU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Yf+Sa9LpqjE5bQSyUilcDzH2Q24BcWkdBkfOQhXrhqGm4Bk4rEwF7mimZ64dco9xm
	 KNwsG/DhnzWsgl2gSmKDF1fl+4yIhYdMCNOuFRgthtCkOEbXme/chZCowT3Rpi3UdL
	 qDm5b7MUc/m6ifExnIWtHHfrW8yv3onh7ac31YGoCAT8I2q3jC8/soMoUX6p/VYI0m
	 82WiNn5xczOPjUuEvkiFYsjijVlKbOtI7kAXCY+QvC3TIJAuFg3JLQ+1+w5rbUFXXu
	 LqVMqlcW7+FTgWJofB81sZwLt8SLiglizQ8QnYa3EuA/+zosJFpwjz5pm5gF2aA/WS
	 +En24+/iFiv9Q==
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12a71ade78cso2269714c88.0
        for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 06:44:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU39exQbdPoAeeFS7EZAxit4T/u7dljlmu4vIhVm+SAcpC6N9j733tSR3dYFYlRccXnZHt7I9B7YjTi@vger.kernel.org
X-Gm-Message-State: AOJu0YxSbRxen1deLB/piofyD9BK2gkNbUMP/AvhErR0IAppvMvxqjuK
	pOSNwlshPYLmnztngsHBzqAWcheN0uqeXZVBMiJPoNYOsdIj5NGB2zvNI17RKjPs8K907bAnHpI
	jWfTEC6bzSxgKiX+KAMSdsG+1AGKHP+VhpsmPThVdVw==
X-Received: by 2002:a05:7022:b81:b0:119:e55a:9c03 with SMTP id
 a92af1059eb24-12bfb765d17mr1120319c88.31.1775223864867; Fri, 03 Apr 2026
 06:44:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com>
 <20260402-baytrail-real-swnode-v2-2-6f5054a4cc07@oss.qualcomm.com> <ac7ZA6HJFBhyCROM@google.com>
In-Reply-To: <ac7ZA6HJFBhyCROM@google.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 3 Apr 2026 15:44:05 +0200
X-Gmail-Original-Message-ID: <CAMRc=McaXJbjy04gwyZmszdPs_4RW4WLrU0X6X6wuqKbm_mj1Q@mail.gmail.com>
X-Gm-Features: AQROBzBvZ243TFYFU14BrtTCsxbTjeeOTP888iqw5ZnYmqyZQD-y8m0ypGLIgFE
Message-ID: <CAMRc=McaXJbjy04gwyZmszdPs_4RW4WLrU0X6X6wuqKbm_mj1Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] gpio: swnode: defer probe on references to
 unregistered software nodes
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34646-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B3D03394A5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 2, 2026 at 11:04=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> You need to change that to
>
>         if (ret =3D=3D 0 || ret =3D=3D -ENXIO)
>                 break;
>
> because if we get -ENXIO that means the GPIO must be there (the property
> exists) but not ready yet and we do not want to fall back to another
> suffix.
>

I'm wondering if we should make this check even stricter and only
continue on -ENOENT - which means: there is no such property - and
bail out on other errors.

But that would be a separate change.

Bart

