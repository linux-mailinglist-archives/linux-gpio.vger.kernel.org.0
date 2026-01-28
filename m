Return-Path: <linux-gpio+bounces-31194-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4O+bB0fAeWl/ywEAu9opvQ
	(envelope-from <linux-gpio+bounces-31194-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 08:52:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 398E19DE01
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 08:52:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53569301CCFB
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 07:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 113C132ABD0;
	Wed, 28 Jan 2026 07:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U7qhaBRf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87D832AAD3
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 07:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769586700; cv=none; b=ppuUs5FH60RJczHmTfC5Tj2pGIxKFSBuCKX9WZMeZorM/QJifwkkALOVOmYpxfHZH94rlAAS6K+YFg5YU63Mu+tyDQTHs3Wz/GG7J2VWEXJCKnQsBtvqmzon79TSJagV25RHyC29Iv0hOuStbYzMtfjTB5mAt5R+ShWX8uPs2kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769586700; c=relaxed/simple;
	bh=/Yiy+NUgb8pS3cFOXyYUf3WXckctqoYw8gJ6s+FKF2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nRxOJhdq/JVGlA9irdf4JDTOQohkAdbL/lvFNdEHYsAjUiqxYeyDbIDoEKzqn2/EsS+rda6vC2BaOnJIC0yERUwZUDj0Xh/AkU+KMaeCFmFbFdk+x6+Eqx25S1poUGAGuebIfyROu6N0Sa+vx5CX+K3SQCsBuajavSW9yMbLv8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U7qhaBRf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77F61C16AAE
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 07:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769586700;
	bh=/Yiy+NUgb8pS3cFOXyYUf3WXckctqoYw8gJ6s+FKF2A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=U7qhaBRfoK6bXJDZ+H9rh7W9XXJF3ERUvjfSJFzMY4cmIIihM3QEHoNFiz/THoZzb
	 vGpiuX7A1Cqjoa9QyLVx/agNhl30HfdNOpxUD3dmIfJ2kq102xWdllImisDoHVti24
	 QjUZKndm/VSiP5WGycl2q6BOEFdug25VbeLvua4OdeJnFAysSaFY4TOXwLj460F48m
	 IGHnzUjec3lI2R8bY7frsQ/+m2EdjwBRw39Pypa+in/eJWHB6xG2poxIS0WtV//XBy
	 +UI46ItNQZzIlMfdMhmTADUU3HbJ50Mw0QC0fK6poh843Z6ZoFOcmB/dyVzMWCA2pe
	 w5GvIixfZFmew==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7947cf097c1so11640467b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 23:51:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVtqI7Qhu0ofgu90Y3tUR+WB66vahlIT6on1XSqUG52d2hTat7OzV7vm01kFe1SnadoI4TszFz7eBXP@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdyq5UA3vhGiIXzr8YvW2+jclENnoSDIi4iB3MqEX/P81PPCKg
	pu/cg5xUUAxgzHhOKSDV+iWC/p5swwE1xi7JD2NjEuHaOCuS/PcVSUPmfsrRMaKklgse2vFy94p
	7ASrdtWUFbK7NWhKbq1tnsJbUHBHI/Oc=
X-Received: by 2002:a05:690e:1289:b0:649:548a:d6c5 with SMTP id
 956f58d0204a3-6498fbe854dmr3220862d50.11.1769586699868; Tue, 27 Jan 2026
 23:51:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127-smaug-spi_flash-v1-1-5fd334415118@tecnico.ulisboa.pt>
In-Reply-To: <20260127-smaug-spi_flash-v1-1-5fd334415118@tecnico.ulisboa.pt>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 28 Jan 2026 08:51:29 +0100
X-Gmail-Original-Message-ID: <CAD++jLnNMbbFXYkVGYBtJcVpsOhWrTKYrdN-JMh77FXUh6SPow@mail.gmail.com>
X-Gm-Features: AZwV_Qi9GgKR-Wfs4eSPEN6B0D9wwAYtOEw4e3Dh0PpM4OBb2-AEy-Ll1ouzI1w
Message-ID: <CAD++jLnNMbbFXYkVGYBtJcVpsOhWrTKYrdN-JMh77FXUh6SPow@mail.gmail.com>
Subject: Re: [PATCH] gpio: max77620: Implement .get_direction() callback
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31194-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ulisboa.pt:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 398E19DE01
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 7:53=E2=80=AFPM Diogo Ivo <diogo.ivo@tecnico.ulisbo=
a.pt> wrote:

> Add support for reporting the current GPIO line direction by implementing
> the .get_direction() callback for the MAX77620 GPIO controller.
>
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>

Looks good:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

