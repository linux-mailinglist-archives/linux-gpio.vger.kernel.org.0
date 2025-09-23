Return-Path: <linux-gpio+bounces-26535-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAEBB97E82
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 02:35:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D33FA4A75AB
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 00:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC0B196C7C;
	Wed, 24 Sep 2025 00:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=maguitec.com.mx header.i=@maguitec.com.mx header.b="ZjVMbgV8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-g3-154.zohomail360.com (sender4-g3-154.zohomail360.com [136.143.188.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0661188000
	for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 00:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758674103; cv=pass; b=sYlWQSBTNx1AMs7v7IuP8xSbvwXCZ46IRIbZFv1w4Pv/WOGng8awV29gjdAbVAUfNkKtfQcUyh1Le8kVxb/1GtCU9u1rtGNcNk5EnYFQJ6VWymkq3UC+VN8utvFXnugcwxYmCJ5z3FATz6DXJi1bIUbTzxvdvs72lHUnwLqNpGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758674103; c=relaxed/simple;
	bh=y4+DUrum8S2Ayr54uad0DHPuoYvpGN25WFjSpUY9njM=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=ZZqxNgP5v32vl2WYEqYNXh3psyLTUnEwBJZhrKyY7WFd4VBZvu4t4Fl1lNX7a8pN/pf3FSCr1UsvwzrXdcpN1obcwzBCmlFgK5bSrR/7u+niC9+M8vD44kkSrGxhpLC0PP1KFoB3n0iSjT/2bLFOGeT33AF0qXJem/gzT+5EQnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maguitec.com.mx; spf=pass smtp.mailfrom=bounce-zem.maguitec.com.mx; dkim=pass (1024-bit key) header.d=maguitec.com.mx header.i=@maguitec.com.mx header.b=ZjVMbgV8; arc=pass smtp.client-ip=136.143.188.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maguitec.com.mx
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bounce-zem.maguitec.com.mx
ARC-Seal: i=1; a=rsa-sha256; t=1758674101; cv=none; 
	d=us.zohomail360.com; s=zohoarc; 
	b=IB5I7+ZM8LfOULAQQYvPgw9vRBga/B1//a5Okkl6hYQEzJNpNkxE5gurL834FZI8FIjqWaNKLnXXARR1sAb3yz1ay+F9j34XhbKDISPOsVu6fPrD712aNn1lsBJWCW6GYiSx17cqjuIqqRl3q1po9nS9bExM3X+vwLhA24nbSo0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=us.zohomail360.com; s=zohoarc; 
	t=1758674101; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Reply-To:Reply-To:Subject:Subject:To:To:Message-Id:Cc; 
	bh=y4+DUrum8S2Ayr54uad0DHPuoYvpGN25WFjSpUY9njM=; 
	b=NPskrAqNcK09cZ6PpWHcit6EKqhTQAUooU4GvW4c0G98pDBbgsI+G1B/VxYcUnb6N+ETV182Ub26lvf4JQp9bQNR+8riCSG30oSqxOga7XSgOy02dXcK+RMLjOXyMbJmDFyLOejCAaDpl5jVDGkq1cZhNybXTNoRzovdUm+NOQs=
ARC-Authentication-Results: i=1; mx.us.zohomail360.com;
	dkim=pass  header.i=maguitec.com.mx;
	spf=pass  smtp.mailfrom=investorrelations+9a721110-98d8-11f0-ace3-525400721611_vt1@bounce-zem.maguitec.com.mx;
	dmarc=pass header.from=<investorrelations@maguitec.com.mx>
Received: by mx.zohomail.com with SMTPS id 1758671653201644.9215294372963;
	Tue, 23 Sep 2025 16:54:13 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; b=ZjVMbgV8X1Y4CFo/njhmW9jhh4hEOqWrFrPMPyb5o6N+Pk3HDxglJGIMDjtrWxYDBNYfe0XpV+RdBqkwe5aqHv4rsBnHnVaZSJoCBWS1ztApt//kNNf7K6zrAi1MlZpAvgHwsFBjqS9iur8CFn8dDD8+1UDz7JICNK5dvrZlvBs=; c=relaxed/relaxed; s=15205840; d=maguitec.com.mx; v=1; bh=y4+DUrum8S2Ayr54uad0DHPuoYvpGN25WFjSpUY9njM=; h=date:from:reply-to:to:message-id:subject:mime-version:content-type:content-transfer-encoding:date:from:reply-to:to:message-id:subject;
Date: Tue, 23 Sep 2025 16:54:13 -0700 (PDT)
From: Al Sayyid Sultan <investorrelations@maguitec.com.mx>
Reply-To: investorrelations@alhaitham-investment.ae
To: linux-gpio@vger.kernel.org
Message-ID: <2d6f.1aedd99b146bc1ac.m1.9a721110-98d8-11f0-ace3-525400721611.19978ffc4a1@bounce-zem.maguitec.com.mx>
Subject: Thematic Funds Letter Of Intent
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
content-transfer-encoding-Orig: quoted-printable
content-type-Orig: text/plain;\r\n\tcharset="utf-8"
Original-Envelope-Id: 2d6f.1aedd99b146bc1ac.m1.9a721110-98d8-11f0-ace3-525400721611.19978ffc4a1
X-JID: 2d6f.1aedd99b146bc1ac.s1.9a721110-98d8-11f0-ace3-525400721611.19978ffc4a1
TM-MAIL-JID: 2d6f.1aedd99b146bc1ac.m1.9a721110-98d8-11f0-ace3-525400721611.19978ffc4a1
X-App-Message-ID: 2d6f.1aedd99b146bc1ac.m1.9a721110-98d8-11f0-ace3-525400721611.19978ffc4a1
X-Report-Abuse: <abuse+2d6f.1aedd99b146bc1ac.m1.9a721110-98d8-11f0-ace3-525400721611.19978ffc4a1@zeptomail.com>
X-ZohoMailClient: External

To: linux-gpio@vger.kernel.org
Date: 24-09-2025
Thematic Funds Letter Of Intent

It's a pleasure to connect with you

Having been referred to your investment by my team, we would be=20
honored to review your available investment projects for onward=20
referral to my principal investors who can allocate capital for=20
the financing of it.

kindly advise at your convenience

Best Regards,

Respectfully,
Al Sayyid Sultan Yarub Al Busaidi
Director

