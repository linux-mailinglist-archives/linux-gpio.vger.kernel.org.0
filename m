Return-Path: <linux-gpio+bounces-13931-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D35C89F44AC
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 08:01:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85608188CA37
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 07:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F9E18C939;
	Tue, 17 Dec 2024 06:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="OmHijS/4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out203-205-221-240.mail.qq.com (out203-205-221-240.mail.qq.com [203.205.221.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CCA192D69;
	Tue, 17 Dec 2024 06:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734418511; cv=none; b=VxCgYXRly7FKz4uo4vGNETPoYFyIzsZtBlwAhHMfE6tJKq+zKf7B79aqBhmkEc0P5xiUoxbw5TS4rgAy86hlVHd/YpruFbgqyuWkkZ1BKuKXj8BO/XDf66nOhCmQ7v8LLK+VOAsxUL7LcrgxiAU/+0VivtIQDQgiSqpr2myyg2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734418511; c=relaxed/simple;
	bh=jvtIzZUA0+P+IAjrf+BGByRnWD+FPhJa1/w0AyEWXRc=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=JykWlJrHQW7Q0hVa3cHuBM1COIGqPHrnfnVj4+Af7SjEcHXrjPER9egzeFqYkCK2HmPvh7jnq+79aNlA7GKG+XuKVztrMLD2oByWYj4iTJlDRoKPC77PP6/WLAn7dDTVyPb+4xI/TNYyqsxAkkKLzh5ZX/aI0vn3hS4ibtubnj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=OmHijS/4; arc=none smtp.client-ip=203.205.221.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1734418499; bh=jvtIzZUA0+P+IAjrf+BGByRnWD+FPhJa1/w0AyEWXRc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OmHijS/4TG/jVKztp4ET3imSERCHB+LgJIDLRLrUU+KbxAY1KiJKXdPiPHH2FvsB3
	 +ZnHspBrn/a6hVsGV+CbhQN5IF1UjijSyfB6gREWMxqv9kgMQwTmXl9BuSjxzxb5Io
	 mU6C9ITCS3Fk1Dn2XV3th3NOpwXg/ahyRsQ/vWkc=
Received: from pek-lxu-l1.wrs.com ([114.244.57.34])
	by newxmesmtplogicsvrsza29-0.qq.com (NewEsmtp) with SMTP
	id C2F2809F; Tue, 17 Dec 2024 14:48:47 +0800
X-QQ-mid: xmsmtpt1734418127txlc4sf9c
Message-ID: <tencent_A2CD92F8865949AE6ED1AED2CC9327C50606@qq.com>
X-QQ-XMAILINFO: No4GWyI4cWt6rn36ibeQIyc7nnCGJv+nF3NANQpK1hGTFoon2/qXm7VYXCXrrp
	 tokQxTqtUaj8WYM26+40bkNhdd/OfaCm3CkWUDUevNpltOfwIo2FHdhoOAZIjpo6XLo30BVf3W0C
	 SPXzhmSRInxA+6vQiHafXpWzErY1Vzfkdhtim2CY/QzkAYX0D+pPuKcH1SfRBOdZVxR9sJnyocfv
	 6fcEPMjpSmXfTiMSpF83EGYSde40kQ0ZSm+61RCf38H2F9Gnxsnnvh0UqzFGcovLRZLrahpx2p+X
	 4Ab9sgml5ENMQkwy7ksAdb0LTEqA90pnn4asIld3VmoFuFtJFGneQis6NdTGHSezvTHr3yPcDKUy
	 xUk7cJSThe8yrmUXolEnqNzIXd4+ixLV9o6j4jTAkFn7LbSy4wmHrrysbFRk3wFFffKQTnhdYr0l
	 hHOUWNcyCiDsT9B7HldjTveHDgwqH54RlfSpbA035NFLxpjQWcMFMo7w4qWTJuZBhsiy8g1X8gfp
	 Mwb6hOVcLC6/WVI58SzRQwmUZ2vrVs6BgMGQlMnoCc9kT+NnIfu0DHpFjiOSHVPRiPJW9EGkcw+s
	 Z/Hngy47pXT9cSdzSzhFsonAJq+Me2gbavr9rW7IBv/vxNY0km3g/j9CaW4kjKHReogbMkPB2n2u
	 uA+hMeysGVDt+LbrsWe5yl01vZ6tKts7UZtKo6hCB8ut5vn+UrH4DQC+vASAKUp1ojswQBIZoOuy
	 g98iIOrcVVYu46fyS+4ApHZfHg0lOzlth1Ndtq76ixPk1C0fXmkNNPVvQaZk/UKG12rqTh1LDntm
	 S2Y2S/eigq8wi+gKfo4bg61ugWclQn4K8VuvQNZKBlNcQTCIaPTO3RekMRz1xXGPfbyH3lfz/i4b
	 4NwXYnkp8VkZkbLf6Xq00=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+b95d0c98f01e7a95da72@syzkaller.appspotmail.com
Cc: brgl@bgdev.pl,
	linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [gpio?] general protection fault in gpiolib_seq_stop
Date: Tue, 17 Dec 2024 14:48:48 +0800
X-OQ-MSGID: <20241217064847.2820748-2-eadavis@qq.com>
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



