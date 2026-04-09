Return-Path: <linux-gpio+bounces-34953-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKq2JEyv12kORggAu9opvQ
	(envelope-from <linux-gpio+bounces-34953-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 15:53:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B20E3CB9AA
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 15:53:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81D5A302BE20
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 13:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1A9829405;
	Thu,  9 Apr 2026 13:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lOvBGmHm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E312F5328;
	Thu,  9 Apr 2026 13:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742453; cv=none; b=NQqqepQ4wYJ2K8yDVgzO9TmZ6ZEEYqB3hekArCN1nVvO1p6J9Lawn5DqoAwn8Mh7snr72PhBKp81APO03X37HpY3UZWkt02NLrbhor6HmhRQk5pIt3Fj/w8sOmwQNhMYl5orxuEsIC9gYl9UGuw2WS0aT2gv/xt465mNA1v1PpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742453; c=relaxed/simple;
	bh=8Nu/CQvFeYR5yiNBtLOEgTy7N/ko3sc5ldK1F+qGoHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FlBEtxAaIbyqRU/gYt3R23ztJ6i54qYX/lXcgwCQ2HrE+q5GpaMNwLq5HZq7jApP85lAL9n0UzUu7zfynBB5MbITjCR5Y7HaNTjMjNLIChYeL74WgYlpdDNYDcTKYY60nc0JhRjnDrYxAMMw5Ko7uC9/tKSSUGc1Ku1q2ilulEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lOvBGmHm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A93EC4CEF7;
	Thu,  9 Apr 2026 13:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775742452;
	bh=8Nu/CQvFeYR5yiNBtLOEgTy7N/ko3sc5ldK1F+qGoHY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lOvBGmHmDcobJNWd982v380vpSO3cAttrtEM24M4lS+g1igJtrq8uUlizqHOqkxr+
	 dJfBNsEjmo0gqakT3aBFTfTimQQzg+CdIx/3ydJT027WGxwKUwH/Mrlr6VmkzroXxp
	 N9HNV/61yFeOMSF1VNgvgFn1xmz672iLIy0av51W7xCBELDLlosRnr3KuL99CqW2H4
	 OmuQ+j0GH30PVITxLoXZ8IU5+1+uou/L4fENluuiQ4PmeZ1buEDpGgnaFjxx3Rw3wA
	 3/mKtmhXnbc7yAP9rTrtCnzCMeglB/YHsSLqDkxnPWGX7slqdua7TdlFY4RS3F0B7W
	 BcIHgmaeCwMzg==
From: Danilo Krummrich <dakr@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	brgl@kernel.org
Subject: Re: (subset) [PATCH v4 0/2] driver core: make references to unregistered software nodes a special case
Date: Thu,  9 Apr 2026 15:47:23 +0200
Message-ID: <20260409134723.3096422-1-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407-swnode-unreg-retcode-v4-0-1b2f0725eb9c@oss.qualcomm.com>
References: <20260407-swnode-unreg-retcode-v4-0-1b2f0725eb9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34953-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2B20E3CB9AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 07 Apr 2026 15:27:56 +0200, Bartosz Golaszewski wrote:
> [PATCH v4 0/2] driver core: make references to unregistered software nodes a special case

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/2] software node: return -ENOTCONN when referenced swnode is not registered yet
      commit: 84cb5edd3d2b

      [ Drop software node backend specifics from
        fwnode_property_get_reference_args() documentation. - Danilo ]

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays.)

The patch is in the driver-core-testing branch and will be promoted to
driver-core-next after validation.

