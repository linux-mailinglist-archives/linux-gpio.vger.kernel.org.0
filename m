Return-Path: <linux-gpio+bounces-32333-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JDUHScTomnQywQAu9opvQ
	(envelope-from <linux-gpio+bounces-32333-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 22:56:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 939281BE529
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 22:56:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DE19B3033BF6
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 21:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C99F84779B5;
	Fri, 27 Feb 2026 21:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KHvzLT+A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1C5364942
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 21:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772229408; cv=none; b=oMh5cyJmzBfTHdeaXq54RZQVDAVism9DuAanLEqvsQIz64jOHemz8dcsNaA8qWJESvti3XYw4Ro0aFlPoX2UwwEDRqfUm3TdvXirfjI/SPkTU1GnnuDvSEl8CHA+rOMZWm+0m5Kn/tmNqs60j1aslc4O014MxnVQUdyeZPJflhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772229408; c=relaxed/simple;
	bh=AvEpIr7JJVsI50JUhmJdsTlnt1Syf+68ANtVsr4C84Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dALVi6WTC7ANjxt9Yvh0fOn9rOC4G4wgmqxXyPnOmiE7eIPQXxea93/8y6Lc+wqj+4RCLwag3RuhFmilM1lgpsrBC19ARKtBrmGW/5IfhO5DK6o8thiR8F+o54rry3SnSVj8tFa3sQ83w+ehTm+YQ9aIKilWsvgcQV0OQpdVMyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KHvzLT+A; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64cb577e79cso2649463d50.0
        for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 13:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772229406; x=1772834206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LfGQsblqvWKg0e6+/H9Wxh2w5oUKjb4XpQurDawWqOo=;
        b=KHvzLT+A++kYzYBnUBw/XPK0gx4PCuw/ROMla6uyNJzFtRE851mJ8vxbP1bkeAPI31
         k1I31Q1sAG5Gvulis3R0Owo04/ZM03xU8fmA0ZBO9G+Tm7HFUPtUYKNrHaHpt9aEmHJx
         oIX882b1wxvYXQZgiDckhYFuurYaMoxBdH/NCrZJHV0219W2fwnNRcCQlZOKaQIsfDQe
         TTghipCaZF7jVXjmAR3q0PLhyUZgQwJxW89j+9ZSl/6YiscojiYfCdK+nCAgg+IWrG4h
         rQNDV7y3AM7BXAfnC8H326iXGNfGRVKIHk2AkMaMFXjf5XU/IEshJJsTWxY6rB2SE49o
         P7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772229406; x=1772834206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LfGQsblqvWKg0e6+/H9Wxh2w5oUKjb4XpQurDawWqOo=;
        b=C2yrdHifk5ZAfhG8+k6RScScw2VCAnKbScTyAl01kCc3u+6cjkNvQOPfsXls8fc3u3
         79YEKmCyviMUWJtAT712nMyAX7dws0sUJUut670ogpG//8msHEHvrt4X4U81TvfOhexy
         uYEyFqQWXloxC3QCSAIbJzkUq4zjtHqoKpQaS4wQLbOFjxlquHtK3kNSMp8ssbAbaXZL
         NyRiswL4gcTw9heQ6+wFshnDpAgtGyEa9Tu38rfN1dqWwKe8tHvH0GyRBImL0PuI+nEg
         WwK3w0CRIRVJImPfaQJ/lyYPQwzZ8Z7RAAIs61TRHOkyupD3+udeBN9Uqn+RE+GhBho1
         UaFw==
X-Forwarded-Encrypted: i=1; AJvYcCWGWGIoFheZFjP8Oaq/iH0/svUBqsl7l+d4UmpLGhN9TQLT+wGj7gTtVeoWxg4MnL6corlgtVLgof0A@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4xtAx//pOfH3NVq+0iSl+P/ywkS88kQVAVUtoax/8FGE59RA8
	9vcTrjg8R1ogIPDi1+dzzglnTFfbfwTrftHl3RPnzDG8CtVvcaP8cRSR
X-Gm-Gg: ATEYQzyopAQhSUH45eqM4kNkumvejL1ATKbws8xLYXjyRE26AdqkDxlWdrSzFV7xKKZ
	knG0VDLnh4AeBkbeFTa3/kiePO2ByVjuGNXlZudmeshfX+07NLJq8JeLV+GyB91FxLx0aoGcV7+
	vpzqM00Fy7pRNNr6rmbSoaTh5aOLS/T2i/8VTyjkBpjevHLz+wQ6g5FmTq4sRvThrNhHEjUgOuu
	vHeoOkjrEcPkBa102CyK6xZFsWVqiYE+fR6IX8k3Y6slPyM0l2piUWn2Q+ySJgNye2vXQtD6tzp
	0m0Wm9QiBNMD4oaUxr4ci32d9HVtf4p319uv+fHPEM8Fp6Hr23J0qbiScsrAE9EA6/dJ7HJD4MY
	XOx6/bRTb9RzoPj+nNvtqbOMb5po4InR953aHyF+Pm1O8sfKeg9rsfMF7+PDy80h0cYkmok6ZoP
	SmkNdqWpvup0GSy0F6aDaZK04o9Vz6MiVABZ6r2+YLXPDz8KQji01D4c6bOfPihQPNG0DppWwhb
	KH3xCHyFARARZ9hx02Axc8u
X-Received: by 2002:a53:d0d2:0:b0:64c:9a6d:665a with SMTP id 956f58d0204a3-64cc2357540mr2303980d50.87.1772229406436;
        Fri, 27 Feb 2026 13:56:46 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64cb75a1157sm2948509d50.6.2026.02.27.13.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 13:56:46 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Joshua Henderson <joshua.henderson@microchip.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH v2 0/2] pinctrl: pinctrl-pic32: Fix resource leak and convert last manual allocation to devres
Date: Fri, 27 Feb 2026 15:56:22 -0600
Message-ID: <20260227215624.1094832-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-32333-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 939281BE529
X-Rspamd-Action: no action

I made this a series so it's easier to backport the bugfix.

Ethan Tidmore (2):
  pinctrl: pinctrl-pic32: Fix resource leak
  pinctrl: pinctrl-pic32: Use devres version of gpiochip_add_data()

 drivers/pinctrl/pinctrl-pic32.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

-- 
2.53.0


