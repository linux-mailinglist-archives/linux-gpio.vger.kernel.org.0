Return-Path: <linux-gpio+bounces-26198-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97335B591B5
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 11:06:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 231BA3240F4
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 09:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 350182BE7B1;
	Tue, 16 Sep 2025 09:03:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from www2093.sakura.ne.jp (www2093.sakura.ne.jp [59.106.171.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E131295DBD
	for <linux-gpio@vger.kernel.org>; Tue, 16 Sep 2025 09:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=59.106.171.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758013387; cv=none; b=knz802W1Lm3CSwlqiMe8sDLLg1jMzsNkUnrYAt6cfg4P/ftPzsLCUqRAXB5xxjEmcZeiM6eOZWtZwNRQWAjI363aMMtqxKLDeZ79sqWtLR+8B7wbvFlcbeqE2xYPELFeM85CRNOSVM/nl8/Cnnod0qEuQRmO6z4glWYx69flFxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758013387; c=relaxed/simple;
	bh=kOVck6LeGxgX5kOw034ZgYIc/8AVqMpUKpezd8v68q0=;
	h=To:Subject:Date:From:Message-ID:MIME-Version:Content-Type; b=mTT4LakAtvNPxXwYmoZhzR+e6WHwqapcD59jeRtBVAXQwZS/+z5yvmc53QPE7VLOcJ27w8VejAhQu2YTkzEEkiIEKGU9h/aC/pkYo8+jZ916O9/5PhUee1RvOQdjpm1zE7Xeo+FEC+4oN53DHEfVoBz4hntH7m1qLDP4zLrZ/Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yomogi-herbal.com; spf=none smtp.mailfrom=www2093.sakura.ne.jp; arc=none smtp.client-ip=59.106.171.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yomogi-herbal.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=www2093.sakura.ne.jp
Received: from www2093.sakura.ne.jp (localhost [127.0.0.1])
	by www2093.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 58G8HLo7064153
	for <linux-gpio@vger.kernel.org>; Tue, 16 Sep 2025 17:17:21 +0900 (JST)
	(envelope-from yomogi-herbal@www2093.sakura.ne.jp)
Received: (from yomogi-herbal@localhost)
	by www2093.sakura.ne.jp (8.15.2/8.15.2/Submit) id 58G8HLZP064152;
	Tue, 16 Sep 2025 17:17:21 +0900 (JST)
	(envelope-from yomogi-herbal)
To: linux-gpio@vger.kernel.org
Subject: =?UTF-8?B?44GK5ZWP44GE5ZCI44KP44Gb44GE44Gf44Gg44GN44GC44KK44GM44Go44GG?=
 =?UTF-8?B?44GU44GW44GE44G+44GZ?=
X-PHP-Originating-Script: 1354:PHPMailer.php
Date: Tue, 16 Sep 2025 08:17:21 +0000
From: =?UTF-8?B?44KI44KC44GO44OP44O844OQ44Or5Y2U5Lya?= <info@yomogi-herbal.com>
Message-ID: <zDR7FeW1CKmtsRlRLqyhjVWyP0b20WTRRefi3nsU@yomogi-herbal.com>
X-Mailer: PHPMailer 6.8.1 (https://github.com/PHPMailer/PHPMailer)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

【Sadaunimi　様

※このメールは自動返信でお届けしています。

お問い合わせありがとうございました。
折り返し担当者よりご連絡させていただきますので、
しばらくお待ちください。


----------------------------
お問い合わせ内容
----------------------------
■お客様情報
貴社名　　google
フリカナ　google
担当者名　Sadaunimi
フリカナ　Sadaunimi
電話番号　81744754175
メールアドレス　linux-gpio@vger.kernel.org
メッセージ本文
Hi, Congrats! You’re invited to join our new venture. Register your account: https://tinyurl.com/375zm6t9#iT5cDJ activate. Notice: Didn’t sign up? Ignore this.



-- 
このメールは よもぎハーバル協会｜よもぎ蒸しで現代女性をあたためる (https://yomogi-herbal.com) のお問い合わせフォームから送信されました


