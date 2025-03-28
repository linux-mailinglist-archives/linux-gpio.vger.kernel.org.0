Return-Path: <linux-gpio+bounces-18086-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 338A0A747BE
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Mar 2025 11:14:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6EDD17C270
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Mar 2025 10:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4715D218823;
	Fri, 28 Mar 2025 10:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oRPCBm0z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0426B4C6E
	for <linux-gpio@vger.kernel.org>; Fri, 28 Mar 2025 10:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743156873; cv=none; b=hbEvhFd7BLlYECL9O5dMcfMfK3QDgSU99rZ9JQGvc+wm0caVDEBzRMxieivZ6Q5woYOTLk6C7nYUjqXVYl1ZBpUcooxObuypPn3bxOiO/g5YbVRdkVajVmlA9ko5nNqynRRsfuwn1T0RqJT19hQRZj7hJMZQZf9Vbax8N6r4kAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743156873; c=relaxed/simple;
	bh=zdqcz8ivyzIbYOHWS1GoS9TSuqPyCz9pEjHjyQymZnw=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:Subject; b=trWNnPBMMLs55XgpQF478xqfXKmYvyACpvdVHyKPJ5GzOhCVv+hua6i6R4iP00uopJNemTCO4jqF2hfrsEVcPLthRvMa3eZttlq15KV9hNQ03eCu5iFvUZd8nWl5K0FicUVPdP70y+tzJAM9ZFB8yHAYerSk2WOhERInomfqzlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oRPCBm0z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7635BC4CEE4
	for <linux-gpio@vger.kernel.org>; Fri, 28 Mar 2025 10:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743156872;
	bh=zdqcz8ivyzIbYOHWS1GoS9TSuqPyCz9pEjHjyQymZnw=;
	h=From:Date:To:Subject:From;
	b=oRPCBm0zVsiw1NUisjelBl08U3uVmQ2hX78ltwRP0t/wCBTgyz2ns0XkQkcJOPdXm
	 I/s/fCPb944cCuZeVAs9rZjGkCF2oQXpV24p8NL57r/05N3iD+Sgz1c/9lTLYRb1Xf
	 PmgDKJQuVFOMCjLjU+zbwCzZ0JyU2QqGsRmz1ggTS7c+QDJOAzTAjVWO05vbAv4ZSc
	 zYznymZx/qMw24imq4Xz/iSFYjFwRiEgJJAT+UrCjd6NUjxbrmiFZiqv2UuriTC4Ho
	 fiDqqWvj/wcNbyPzgpDFB7JjIQWc86rho9YzqoZwmM0Gn70Cx60pdMIXdzzxnzeHhL
	 0/RYA4qWTEm2g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EF660380AA66
	for <linux-gpio@vger.kernel.org>; Fri, 28 Mar 2025 10:15:09 +0000 (UTC)
From: henry via Bugspray Bot <bugbot@kernel.org>
Date: Fri, 28 Mar 2025 10:15:06 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org
Message-ID: <20250328-b219946c0-f69b453deb65@bugzilla.kernel.org>
Subject: Missing null check in rza2_gpio_register
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: GPIO/Pin Control
X-Mailer: bugspray 0.1-dev

henry writes via Kernel.org Bugzilla:

pinctrl: renesas: rza2: Add null check in the rza2_gpio_register

When devm_kasprintf fails, it returns a null pointer. However, this return value is not properly checked in the function rza2_gpio_register. 

A check should be added after the devm_kasprintf call to prevent potential null pointer dereference issues.

CODE:
	chip.label = devm_kasprintf(priv->dev, GFP_KERNEL, "%pOFn", np);
	chip.parent = priv->dev;
	chip.ngpio = priv->npins;

View: https://bugzilla.kernel.org/show_bug.cgi?id=219946#c0
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


