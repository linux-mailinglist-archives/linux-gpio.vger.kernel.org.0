Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8163649E64
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 12:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729430AbfFRKke (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 06:40:34 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:59579 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbfFRKke (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 06:40:34 -0400
Received: from orion.localdomain ([95.114.66.109]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M4bA0-1hepQm44TG-001jAh; Tue, 18 Jun 2019 12:40:31 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     kernel@pengutronix.de, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org
Subject: siox: driver init boilerplate reduction v2
Date:   Tue, 18 Jun 2019 12:40:25 +0200
Message-Id: <1560854427-27537-1-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
X-Provags-ID: V03:K1:Od4aM4fmkzHf7juVTjpfT9hTLNtLZiRBXdT3JPvX8+iO4dtGdqw
 exQgRGz/8ptCo0sw/U//tYvpjiXaXvp/y6NLiYjW/+1TAn1jS8elKMxKX69HeCZdnoklp4i
 3n4MVD0mS6Zx5ODdKiu9RwpzN566tOkcK4VEM2k69rvSWPy0whSW8+gxLxT0ch+6NTx8hjO
 qhZIii9Enl3BSHzwa2g5A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:noWjooNOWnc=:OwE0GiMr/cWHwjVHoT4SZq
 xlHpeB8RZYROxlfvSz9L28pziCwbmebaULL7lD7IuL7Oku8HUmoe15qJa0X2Ch+94VTYUSpYy
 y4lRLJrcV1Io2g2CV9Tqlyh62YoR3tQNaZbK0jFSelvjCjfzuZLKa1HdE4ImoOjN0oi4fBjf6
 ELu7g5E98erlxFLZzHVK9zmAk2EhLRaAjhWfxgkIcemPhTydiB9pg1qLgD6KqszFNJw4GLJsn
 crtPtmqq+6PnrQOJeWQc7E0g51ThRu6/12W/jz1qbjzw83ZGkeRqPDbPW63DnCvwL3yU5p01s
 Ddc1bcwyPO8QtTdqHNBkMxg48kmSIbLJbleG4i1/6yVg9RVcKyKzlOIUpQEYXro2PLVY9CuUE
 OcuHF9JIBRufM51KehNG8tw+UtMjc43h+U/9ZWeKmIG+b85NDT9bvZTim2zr+w4fTvV6VoA5B
 5uk43IxVoKlGw0I+5WyTW8y/TH30oyMRHeczDJZp+yKK6lrDUq+Ej84WOfLChA04vcQ0/WXkL
 mHt6xj5SDGKhm2XOjEkQ2Id1q+cWlS3TTl7TNy8tO01xTkEGWRvgoXvyAVy2nq44LCS6ey6KU
 HAGr4pKw+AczYC3mfFFCEgh+KeTNTqeq+p82Hxy+U58mtq6Th0J3w3sqgB1ljXH42/muT9trV
 IDSP/N8p4Gvnti2/CikBQMOx35Aa6PU23CaP4C+j5r5RvqQ8ImNx6h5+uV6Kfcw+ckLJbvLLu
 WyaPBqna5EBZOewt6NjAjaiUTjPYbfqRsBHNaA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi folks,


this is v2 of my siox/gpio series from yesterday.

v2: fixed the typos pointed out by Uwe.


--mtx

