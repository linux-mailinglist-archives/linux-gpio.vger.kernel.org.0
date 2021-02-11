Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F75A3194C5
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Feb 2021 21:57:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbhBKUzk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Feb 2021 15:55:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229978AbhBKUzj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Feb 2021 15:55:39 -0500
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 364B6C061574
        for <linux-gpio@vger.kernel.org>; Thu, 11 Feb 2021 12:54:59 -0800 (PST)
Received: by mail-qk1-x730.google.com with SMTP id t62so170064qke.7
        for <linux-gpio@vger.kernel.org>; Thu, 11 Feb 2021 12:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=IfmP8m6FuIWVvKsMvagCx3bYPguuQwa4CTRDDL46XoM=;
        b=qbXv2ncXTodUD+plVb5ZylusydP13BW1+E/lqCIyONrpFpgJh7YS/pkv93V4Eo5mUh
         HApEsiA2oS9JDqOqvrhQrKnoXOBRK6Cwl23N/7JMqS070iBBMPm/tN9swGjr5e41MQrA
         +vBLO3VV6++chFMEGuwlKKPjjQusL5K0NH3T0yeb8NWovjjpoVX818QJwImDZUIrcJ9Z
         AYXhZXqNDx90ZbRL2e1OKqHx0Wn2d0zLrzEkhoT4vut5w+uAfPDNd8ByM9ycydYzpftl
         yboU8q1IZTa/X7fKs68b9EqzCS+Bso5tod5zalKSvsZ03Mt4AmHbNs0tsdOnfYdiJITV
         8WEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=IfmP8m6FuIWVvKsMvagCx3bYPguuQwa4CTRDDL46XoM=;
        b=lCdgT4YJ6bCR7pQXAakgdY6olBGN6iF+zkUNxKkx9CZ8PKZwSrWyzYUEhqj6NIiao6
         ddG/5isINlkmhSqxKQR90oHQ0vosXRk1cd3PAwqXHhclcAbIYcfM0KlA4Xxg2P80w+jv
         jaJXjJuH1MmLzcg7/fe41cRnfI6s43Y06iAfciK9dFMm1/a5iiQXvwuQ9NRyyir+sHQV
         yu8Els5tHv8h98jUlAziDD3JZu6vkVuSJXYLWo8DYm3FcUZp4yOuUBjTf0H2xgw6lCzg
         1FdaA9VEMYDCdmn+avme/1DAWvI5MNoneW1JzHKeCy1cIdqKkmqYWoWCcFKQ+hjBZIe4
         6OAQ==
X-Gm-Message-State: AOAM531uuFghE8t6BeP/+nNYp5b/Kf/VGvyvIduv5iO/ZRXKljhQPtAo
        jNXgE49XhGyAP/t+SW5CzbUviNkfpk6uG7LqhOAg0GCGlhw=
X-Google-Smtp-Source: ABdhPJwOP8tFv1/ig5oHs2+0c7Xd60NfQEbTf8n6RGpi6iptRVyI5Gmle6naEGUzaYZ6VBd8H6wKJS5jiMYt/7TFSac=
X-Received: by 2002:a05:620a:22b4:: with SMTP id p20mr10534672qkh.27.1613076898443;
 Thu, 11 Feb 2021 12:54:58 -0800 (PST)
MIME-Version: 1.0
From:   Pedro Botella <pbotella@gmail.com>
Date:   Thu, 11 Feb 2021 21:54:22 +0100
Message-ID: <CAJAEvhib-M-UQeoCDs+aex-hdE-vJSQk=C5B7z4A9WmR+JcxQQ@mail.gmail.com>
Subject: [libgpiod] Bug in python binding when requesting output?
To:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

I'm experiencing what I think is a bug in the python bindings for libgpiod.
I believe a line.request with type gpiod.LINE_REQ_DIR_OUT always
results in that line being set to '0'.
To reproduce:
1. request a line with type gpiod.LINE_REQ_DIR_OUT
2. set the line to '1'
3. release the line
4. request the same line with type gpiod.LINE_REQ_DIR_OUT
5. get the value, it should now be '0'

I think the issue is in "gpiod_LineBulk_request" in
https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/bindings/python/gpiodmodule.c
There a call to "gpiod_line_request_bulk" with default_vals being
passed as a pointer. Later on in the code, this parameter is checked
for NULL, if it is not NULL then the values in the array are used as
default_vals.
I believe that a NULL pointer should be passed instead if no
default_vals have been requested when doing a Line.request from
Python.

BR
Pedro
