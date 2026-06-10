Return-Path: <linux-gpio+bounces-38269-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vTQGChN/KWq0XwMAu9opvQ
	(envelope-from <linux-gpio+bounces-38269-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 17:13:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C4E66A984
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 17:13:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hsZBTJRm;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38269-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38269-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E560230B9E0C
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 15:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B70E4426694;
	Wed, 10 Jun 2026 15:06:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47025423A7E
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 15:06:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781103992; cv=none; b=K377TF7qSf96GXMD/gEUULhwQukXXnoQX5Ig249IZhwYkP9lR3vVKzc1f5ULT0atOxCLGKI4pYwZHdrWoBNaCcYGwUeEJ8addn524gpoeDjfyEJ0rPiwcrCjrQoCeML++TviLTwf3amy655madxBR+NsrbI/yeJ0PKRF0DcMCGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781103992; c=relaxed/simple;
	bh=n5KY2viCF9d620hXPKRwyH3alTyKCHTYGOkodRCIfnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h6QzieQ6KcgyIBvtP0oIDqROwcCersbbjX2az76yUQp4XQm3rL+JIihTtEgJaywyTwm9io79+Dtv0dJ6tlKN9EBv3b0Ssnt7eZ/sg2hdmGNZiID8qaYE2PBJSMlmW17MCEnMhgZFK7xZ3r+xhNYdc5gUwDzo8QX07yyda2JyXz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hsZBTJRm; arc=none smtp.client-ip=209.85.219.48
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8ce65629acaso77917796d6.3
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 08:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781103988; x=1781708788; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BhXukM9QUkGA+gfv8mb8Arvflyg1/Xv+rebhJGLwPM0=;
        b=hsZBTJRm4D3zFchuJ4wz+jIufJtI8RUqshiDHyQWlrP4MbSY7QEcE+7p7sFQzrh0ff
         Rz13+qCF0mhS13CHfQ9nV3BtugwbpGzeaa0vEhTtB+2WJsJ4flHQzzFLVAq+RB4PlEY0
         CSHjtLuDSP2i5beSdSBi1q5JJaQ7tiDEy4VmvWLDNfpGgsKxAFdr5S8RS3W1yMaRFw8o
         TojabuRB4vVP1LOhogGmwwe5gMydD4IbZiPwwT0yVyHEzY35aD3ZyKTmCyhcmtrGPh1x
         XciqDLjX8lD5Z0owg2t+qrDX4io6zPdY2E+6pCSQff13ZS9RBbFz+6HCDbFCS7Q5gIzA
         PoRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781103988; x=1781708788;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BhXukM9QUkGA+gfv8mb8Arvflyg1/Xv+rebhJGLwPM0=;
        b=Zl3aLqBY/pfUG/uUxQWIAo5belkJ3vbwAgc8qiYdYXFBKq+tH+ZDtOfT8caiikLc/H
         c6kvZO0BthrpSpxgrJSbQzmS9GEkUFCCf0o0JtAbLA2kIeoVlN78VaK4Ri4lJ5prgu5y
         PzTSP4NLSPdm50ksGyuntjH27Xz0cbtNtOtzi/rMn+3U01ZxK7vUi6AlwPlQKU/p79rS
         pVRSSKBO75ryNB3zSi5DAo7MiBp99Fv29Zxs2LkkF0CJjllt4DuRztAUs+IwylHHO3wz
         G4ROWrC0AewzU9P0UdxN01pLdbyZvceh0MIWC8JMNp4cSmLDGanxAxHNxlcdw4H4haec
         adAw==
X-Forwarded-Encrypted: i=1; AFNElJ89I0oz/hx3TmgmwAyEAe7B2NHTvS4syRYTFyU2vXSQntt0daLWM79ke4I7ObxvHTjlHjRahg2RoyXc@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3vGntvgl9nLOTxlxLWyR7rL6LjWA7DqN5BiGvI5v9FUtYTYLy
	tP04LXGNng2/dxUzywAY1J8zvKyzuxe368aHbhZDBi6Ceww3wRtKSCHK
X-Gm-Gg: Acq92OETxIcVa799/CyFVYRYYuPWPJGrPFfq9iuFA/o0UXfgh9kNaJ/8wooQVtZOpBF
	zwNPp8Mifp8Sg2zqu/kQCXi2rF3NYfDwsFtWAkaD86FQHOU/XTVowIzFIbuqmZsJb0W9N8HADDY
	JmfAkGlMSx6V/Xcwa/61SIy1WJl3jbhvnrqyDxCUMq/WMN7Mujn3pnpX8t/2ZOgN+YpzvpUVD/x
	ip9ISzSuTFv4L3qAbijpB8B+9hOLVxzCt7I4CSo6EPrDUSEB71U1konO4G4wKTPoF/DidEgQU/u
	Ra5++gTozG1mgGjr65vmiPps9d7QXiaLZa2WGWbtDwTvyXgBbkqxaFDO4W7HUVA0t/58DuTNjKC
	SFrViPHGYjgjgDd2VRpX3xY4ShBnBjK2THqY0gHbaCL+UOEdwtWNzYOEpSry7+B/1mAN2n+dZDh
	aplVZJKkCiEErTF7IJoB1JFCkD1a7f4IJDwYVTMoQ=
X-Received: by 2002:a05:620a:2b4a:b0:912:1:b41c with SMTP id af79cd13be357-915a9a43532mr4135578285a.0.1781103987828;
        Wed, 10 Jun 2026 08:06:27 -0700 (PDT)
Received: from localhost ([43.225.189.119])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a3d2384sm2460658185a.39.2026.06.10.08.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 08:06:26 -0700 (PDT)
Date: Wed, 10 Jun 2026 18:06:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Cc: dumitru.ceclan@analog.com,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	mitrutzceclan@gmail.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org,
	Martin Hecht <Martin.Hecht@avnet.eu>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Cory Keitz <ckeitz@amazon.com>
Subject: Re: [PATCH v13 17/22] media: i2c: maxim-serdes: add MAX96724 driver
Message-ID: <ail9bHXL_NV2DZK5@stanley.mountain>
References: <20260604-gmsl2-3_serdes-v13-0-9d8a4919983b@analog.com>
 <20260604-gmsl2-3_serdes-v13-17-9d8a4919983b@analog.com>
 <20260610144242.GF2948@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260610144242.GF2948@ragnatech.se>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38269-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[error27@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund@ragnatech.se,m:dumitru.ceclan@analog.com,m:tomi.valkeinen+renesas@ideasonboard.com,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:julien.massot@collabora.com,m:robh@kernel.org,m:gregkh@linuxfoundation.org,m:mitrutzceclan@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:Martin.Hecht@avnet.eu,m:demonsingur@gmail.com,m:ckeitz@amazon.com,m:tomi.valkeinen@ideasonboard.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[analog.com,ideasonboard.com,kernel.org,linux.intel.com,collabora.com,linuxfoundation.org,gmail.com,vger.kernel.org,lists.linux.dev,avnet.eu,amazon.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,stanley.mountain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 73C4E66A984

On Wed, Jun 10, 2026 at 04:42:42PM +0200, Niklas Söderlund wrote:
> Hi,
> 
> Thanks for your work.
> 
> This patch gives me new compiler warnings, can they be avoided?
> 
>   .../max96724.c:402 max96724_log_phy_status() warn: subtract is higher precedence than shift
>   .../max96724.c:409 max96724_log_phy_status() warn: subtract is higher precedence than shift
>   .../max96724.c:588 max96724_init_phy() warn: subtract is higher precedence than shift
>   .../max96724.c:756 max96724_set_pipe_remap() warn: subtract is higher precedence than shift
>   .../max96724.c:796 max96724_set_pipe_phy() warn: subtract is higher precedence than shift
>   .../max96724.c:818 max96724_set_pipe_stream_id() warn: subtract is higher precedence than shift
>   .../max96724.c:830 max96724_set_pipe_link() warn: subtract is higher precedence than shift
>   .../max96724.c:942 max96724_set_link_version() warn: subtract is higher precedence than shift
> 

These are Smatch warnings.  I appologize for them.  I know about them
but I haven't looked at them.  I'll fix them by the end of the week.

regards,
dan carpenter


