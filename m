Return-Path: <linux-gpio+bounces-36576-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLHcKM3XAWrLlAEAu9opvQ
	(envelope-from <linux-gpio+bounces-36576-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 15:21:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDC550EC6C
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 15:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C23E830179E1
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 13:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 097963E5EE7;
	Mon, 11 May 2026 13:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PC1/eE68"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE96D3E5EE5
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 13:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778505449; cv=none; b=e40ptH+QYEEhcTQTlrGAS9L/meQCmsRr+TL+a5q0VuL7H0l3tgYFPyn/HLbqG9vffiO4NR6f7u82QmWRtan//B4W2Q/3ZjIWVX+KfZxiLZTT/OcUFjl44DJnzbsuPY8wrF2MvA5nP0J7nkWYvzjDTibpFyUWpbi6ts/veAiPiBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778505449; c=relaxed/simple;
	bh=Ivlke9h2Q6gt+h0quHZ5To6obcw+aBi9z829FcshEkY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DBOnx1KvfD3JnHWM45Ne/RFOSaecV+dXvGsObFqt14N4x86fysegwhXKkrlOzUcXLAm66B5+Me//ERS7lafGQFHW1r71ZvkPxZmMNhkmNpxfJjf02Tbh0IFFKuUwlM3ZS0f2ViYpM/93U2VVY0Srbk/bc9rihtP1mRaB1Qj3drw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PC1/eE68; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DD4FC2BD04
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 13:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778505449;
	bh=Ivlke9h2Q6gt+h0quHZ5To6obcw+aBi9z829FcshEkY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=PC1/eE68+66lf+Ls5ujxUHPmjRentrY+h/vOo/L8nS3FoTMC6bigAcV5BhDrMl+eA
	 8ruiBKS2ChfNZVhUOZxmbAelo9T7qlDVQ+mH7HADFrcHR5nBPKSEgQqup58eeiHBkw
	 xXoWBTyZbA2Bi7byiyLFsTUdK+SbKW2IHBmVMCqhlI3TV7P8CfbOTyCgS2fddID08b
	 dkiEiBxVykBbIPSZ40RZZEYsBKs9bNkx1rzmjmICUL5QBWA5DRpEaLGVM8RXQzSsCj
	 WzecmpOMj46mXYDiqjXCiWX7y80LVdy4W+tCrUAAw9VxQqzVKzckSuZA4IhG599Ncf
	 sPG3vHbHvACTA==
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12c19d23b19so7081321c88.0
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 06:17:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+PyqAxeqb9kGj25GDK22ggbSLY0Knm7r1JvUKGLgjctlWN9sj5FZhD0dHM5nur9+NC6LgGZ6ex+yC9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw/SbWUIggLguLFJjfVnyXmuTIn5VPlBN/GQMcW2iBSA4yET1y
	o4Gn7mX6Q2LbBDlfVmh0puj8vOshg1e+MNI9E5SJ9u+Db1YdfzEsJe6ObQE2hySxBdsktMPFfQ1
	DsFXmhIUm67zr+t1LjPktd31zJIxwrjEgSFMxP894mg==
X-Received: by 2002:a05:7022:2511:b0:12b:ec15:69d3 with SMTP id
 a92af1059eb24-1319cc31478mr11989560c88.19.1778505448759; Mon, 11 May 2026
 06:17:28 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 06:17:26 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 06:17:26 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260508105448.31799-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508105448.31799-1-tzungbi@kernel.org>
Date: Mon, 11 May 2026 06:17:26 -0700
X-Gmail-Original-Message-ID: <CAMRc=Md8xb-zuXP9aufk2NBj618d+rgqE4oX6fPpYv8ZbX5Kow@mail.gmail.com>
X-Gm-Features: AVHnY4KBwF1U6qLFJW4pfVuTyLWGAEM9X77JMSfR8AbAPb7G8FPU0zA2YpdFOBU
Message-ID: <CAMRc=Md8xb-zuXP9aufk2NBj618d+rgqE4oX6fPpYv8ZbX5Kow@mail.gmail.com>
Subject: Re: [PATCH v10 0/9] drivers/base: Introduce revocable
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, driver-core@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Johan Hovold <johan@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: EFDC550EC6C
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
	TAGGED_FROM(0.00)[bounces-36576-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,lpc.events:url];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, 8 May 2026 12:54:39 +0200, Tzung-Bi Shih <tzungbi@kernel.org> said:
> This series introduces the "revocable" mechanism, a synchronization
> primitive designed to prevent Use-After-Free errors.
>
> - Patch 1 introduces the revocable which is an implementation of ideas
>   from the talk [1].
>
> - Patch 2 adds KUnit test cases.
>
> - Patches 3 to 7 transitions the UAF prevention logic within the GPIO
>   core (gpiolib) to use the "revocable" mechanism.
>
>   The existing code aims to prevent UAF issues when the underlying GPIO
>   chip is removed.  They replace that custom logic with the generic
>   "revocable" API, which is designed to handle such lifecycle
>   dependencies.  There should be no changes in behavior.
>
> - Patches 8 to 9 uses "revocable" mechanism to fix an UAF in
>   cros_ec_chardev driver.  Alternatively, [2] is a series for fixing the
>   same issue without using "revocable".
>
> Since v9, there are two ways to manage the resource provider handle.
> - Embedded allocation: patches 3 to 7 might be the potential user.
> - Dynamic allocation: patches 8 to 9 might be the potential user.
>
> [1] https://lpc.events/event/17/contributions/1627/
> [2] https://lore.kernel.org/all/20260427134659.95181-1-tzungbi@kernel.org
>

All my tests pass with this series on top of v7.1-rc3.

Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

