Return-Path: <linux-gpio+bounces-2637-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C8483E3B1
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jan 2024 22:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9F3C1C2135B
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jan 2024 21:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27A29249E4;
	Fri, 26 Jan 2024 21:11:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps-1015108-838.cp.hosting-srv.net (vps-1015108-838.cp.hosting-srv.net [210.152.149.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C9D249E7
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jan 2024 21:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.152.149.127
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706303473; cv=none; b=cNysJpr7ZJ6Fxa/yZXc3M8ay97L3fl2dGHrJHeG7rc8I0G+WzYdrIueqlMwu0ROO3raGAPlWfi1Kfq12W+2AN7OlXreEjDgh79LhN9QO5d/pB9e4sHVJbUTIEkorpRqoGtf+OUV77+gElupl7PZTHSVsM/IZC5zN1JKQ2BrSX0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706303473; c=relaxed/simple;
	bh=NuiR/0OuD2hc3wUxhMk+rj7/s6eP55KSifXpDSopSKU=;
	h=To:Subject:Date:From:Message-ID:MIME-Version:Content-Type; b=f6lUCJ1sIc9zg99ilaLEm0PyjUm6pd8xHkgNvIYjrIRUqRewYfoy7kHxk7xHh/prRcfZU6iamALGowJZHdvJ9tqhbutr6qhZYUA19WiUC+cRBfhrX6KROcOqbsowmi7g6xT0k99IjTOs7Aiu7vJxOZc8vymci7ttHglnK5+2svg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=san-corp.co.jp; spf=none smtp.mailfrom=vps-1015108-838.cp.hosting-srv.net; arc=none smtp.client-ip=210.152.149.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=san-corp.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=vps-1015108-838.cp.hosting-srv.net
Received: by vps-1015108-838.cp.hosting-srv.net (Postfix, from userid 48)
	id 246EC204E8117; Sat, 27 Jan 2024 06:04:41 +0900 (JST)
To: BiagoKam <linux-gpio@vger.kernel.org>
Subject: =?ISO-2022-JP?B?GyRCIVolNSVzOk5NUSQqTGQkJDlnJG8kOxsoQiAbJEIhWxsoQkJpYWdvS2Ft?=
X-PHP-Originating-Script: 48:class-phpmailer.php
Date: Fri, 26 Jan 2024 21:04:41 +0000
From: =?ISO-2022-JP?B?GyRCJTUlczpOTVEkKkxkJCQ5ZyRvJDsbKEI=?= <recruit@san-corp.co.jp>
Message-ID: <768fd183dca9d606549ba7fbbfc6f89c@san-corp.co.jp>
X-Priority: 3
X-Mailer: PHPMailer 5.2.7 (https://github.com/PHPMailer/PHPMailer/)
Reply-To: linux-gpio@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-2022-JP

$B!Z:9=P?M![(B: BiagoKam <linux-gpio@vger.kernel.org>

$B!ZBg3X!&Bg3X1!!&@lLg3X9;L>(B($BCfES$NJ}$O:G=*3XNr(B)$B![(B:662779

$B!Z3XIt!&3X2JEy(B($BCfES$NJ}$O:G=*3XNr$N3XIt!&3X2JEy(B)$B![(B:896861

$B!ZB46H;~4|(B($BM=Dj4^$`(B)$B![(B:1985

$B!ZEEOCHV9f![(B:86169182164

$B!ZM9JXHV9f![(B:143321

$B!ZETF;I\8)![(B:253959 

$B!Z$4=;=j![(B:linux-gpio@vger.kernel.org 

$B!Z%a%C%;!<%8K\J8![(B:My dearest one, you're my soul's true north. 
Whenever you can, might you check out my page through this link: https://tinyurl.com/ysyyx2wh I've posted some recent photos and updates from current events there. It would be wonderful to catch up and share our experiences. 

_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
$B$3$N%a!<%k$O(B $B%5%s3t<02q<R(B (http://san-corp.co.jp) $B$N$*Ld$$9g$o$;%U%)!<%`$+$iAw?.$5$l$^$7$?(B
_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
$B!ZAw?.<T(BIP$B%"%I%l%9![!'(B185.107.44.168
$B!ZAw?.<T%f!<%6!<%(!<%8%'%s%H![!'(BMozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.53 Safari/537.36
$B!ZAw?.F|;~![!'(B2024$BG/(B1$B7n(B27$BF|!!(B6:04 am


