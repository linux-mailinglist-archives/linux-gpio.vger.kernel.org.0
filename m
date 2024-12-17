Return-Path: <linux-gpio+bounces-13933-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DA39F44F0
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 08:18:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B4C67A540C
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 07:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3689E1957E4;
	Tue, 17 Dec 2024 07:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="rjEswCms"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83112653;
	Tue, 17 Dec 2024 07:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734419908; cv=none; b=bsTpg1o63a4Xisp61tZwgZlKEaQ74DWtVLYmuImtoXImrk41gDVYQpjP8ayS35ghHu1bvahqn3rrcCrdGrcz7r3wdMPekPnsGZGkn3o1exWx3spQfMMs+QBe8EXucidyRCfH3iNl4cemMjhdnARBE0nskgSMtJQm6RCXorgZESE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734419908; c=relaxed/simple;
	bh=jvtIzZUA0+P+IAjrf+BGByRnWD+FPhJa1/w0AyEWXRc=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=if2vpv6k4AnpFDiamyMOGD3ZFnFxCfh/1gbtLS8J5sKoBkXYy23/q/QlcTkj2r8wYSMZ65w32ANcyncB75PjTDy62mvRV1VcSQSC7xM2bSE5K/WEaEjqU71clv0rsQ8uHcWftfueRkc7yEo/JbD0lrfWuNnScay1NcmGERhCVrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=rjEswCms; arc=none smtp.client-ip=162.62.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1734419600; bh=jvtIzZUA0+P+IAjrf+BGByRnWD+FPhJa1/w0AyEWXRc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=rjEswCmsFi7dHioLFzn/65AEP5M59HuXX2WZ4XekwTbXWWtQFC0PGVJq1HfNVgW/z
	 +9plj/UDYt2dRDLbqfOI3ZmSGtixQkt/mSgUVniJk/JSkA4pOpJr3EriYIQhcqxi6r
	 jmWjTN+9SDwVgNAQKm7U9L+SomuAlEhK+uSV1lRI=
Received: from pek-lxu-l1.wrs.com ([114.244.57.34])
	by newxmesmtplogicsvrsza36-0.qq.com (NewEsmtp) with SMTP
	id 3501F8F8; Tue, 17 Dec 2024 15:13:16 +0800
X-QQ-mid: xmsmtpt1734419596txbwsxq50
Message-ID: <tencent_A3A5C98D8F1209DDBF5DFD997FCFD38D8507@qq.com>
X-QQ-XMAILINFO: MaCrHea+JMej848cpSak67AyqtyW+jItj6JNAi3/yJy/QNtYl7g/cnSCRvIBHM
	 B0Ujw5ZiXMHeEo2q6nuWecEC4jp0uigR3lMe8cFsJcPA/yGnYyyQnsQJ6LZa0sy5MOJY5Puxoh9f
	 /SfPmTxL1RMcFUVjBP+ddaLZx19XFu6HvFRenxm32c9L678ilMnfb1FK12Nh6Qia1QPQPaSRgHfx
	 T1UNgrbMmGwZ7NJjk6zkwmfgYWxlsLg/cCL5M07w5BUlSCsGY00o1qjGo/n0/MbdyGE/8i7nbTKx
	 n/BIvnf5Upn5WMaeqT+gqS+KurRQk5QjRiJikmoCmvhoiStNwGCZHME4/uLRzpNpL6g8NgJT7D4e
	 6NQzS5YQ2ZsIeegQK+opnDPdISdbQ0Nsd3n8t08R3BB+Q/g4TLvh7qOTs1rfAnMto76ktWvxiyKw
	 Wl6kDW+jiVkyyxzobSnJ6mKLivPwY19KiOgZtACowB1fCyiBrE6ILVhpbqu69U+/i1L6LRN7oRV6
	 69i4sQp2301RwBQSEQpz8t8xz18rdm2k+nCajFaZzEWEiiPh1+fdG7OY0g5tUXSfp3DzYL6Fy1oY
	 kxNIroq1TOrHubFkT7/WEnwpv0FAL6ZwzuyQ+7IZucX066+qUcB9FsM9Zbzwv3kBZgYC5IqRlFDv
	 ab4/vltEOhjYsxuVnB8GcenKo3wEkuMx+qvoJXllDnfHxG+whCPjEgTf4m+aRbiOikELJksLIdlU
	 R/dYC30VliQJAZIToVmFCH3YEFqzNNwxqcCrCXxMqSbJNB7VJceSZBTlT+3Lkp8xunQOKsfLXCSC
	 7JZ4BwIVOFPIdv45FkMNvOyEXtWDPuqzNWdlBLE/PcKpA8DYLjb4rfWYh6YMtn52EpWnk2fNp2GD
	 4gL4aZxLM1+XFAs1hYRml6Alf6xYNrj66jrUHSBV04beJbScoVO4iFneo+mrBJQcWnp3+ySDGIKE
	 V2/kqDZULl7hw+bKM2uycIAmJbBda6TMYLodwVphk=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+b95d0c98f01e7a95da72@syzkaller.appspotmail.com
Cc: brgl@bgdev.pl,
	linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [gpio?] general protection fault in gpiolib_seq_stop
Date: Tue, 17 Dec 2024 15:13:16 +0800
X-OQ-MSGID: <20241217071315.2846899-2-eadavis@qq.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <67610786.050a0220.37aaf.0149.GAE@google.com>
References: <67610786.050a0220.37aaf.0149.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test: https://github.com/ea1davis/linux gpio/syz



